#!/bin/bash

echo "\nDeploying ConfigMap and Secrets..."
oc apply -f wordpress-cm.yml
oc apply -f wordpress-secrets.yml

echo "\nDeploying MySQL..."
oc apply -f mysql-pv.yml
oc apply -f mysql-pvc.yml
oc apply -f mysql-svc.yml
oc apply -f mysql-statefulset.yml

echo "\nWaiting for mysql-0 to be Ready..."
oc wait pod/mysql-0 --for=condition=Ready --timeout=180s

echo "\nCreating replication and monitor users on mysql-0..."
oc exec mysql-0 -- mariadb -uroot -proot@123 \
  -e "CREATE USER IF NOT EXISTS 'replicator'@'%' IDENTIFIED BY 'repl@123';" \
  -e "GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';" \
  -e "CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';" \
  -e "GRANT SELECT, REPLICATION CLIENT ON *.* TO 'monitor'@'%';" \
  -e "FLUSH PRIVILEGES;" \
  -e "SELECT user, host FROM mysql.user WHERE user IN ('replicator','monitor');"

echo "\nWaiting for mysql-1 and mysql-2 to be Ready..."
oc wait pod/mysql-1 --for=condition=Ready --timeout=180s
oc wait pod/mysql-2 --for=condition=Ready --timeout=180s

echo "\nDeploying ProxySQL..."
oc apply -f proxysql-cm.yml
oc apply -f proxysql-deploy.yml

echo "\nWaiting for ProxySQL to be Ready..."
oc wait deployment/proxysql --for=condition=Available --timeout=60s

echo "\nDeploying WordPress..."
oc apply -f wordpress-pv.yml
oc apply -f wordpress-pvc.yml
oc apply -f wordpress-statefulset.yml
oc apply -f wordpress-svc.yml
oc apply -f wordpress-route.yml

echo "\nDone."
echo "\nUseful commands:"
echo "  Scale WordPress:  oc scale statefulset wordpress --replicas=3"
echo "  Scale MySQL:      oc scale statefulset mysql --replicas=3"
echo "  Check pods:       oc get pods"
echo "  Check replication: oc exec mysql-1 -- mariadb -uroot -proot@123 -e 'SHOW SLAVE STATUS\G'"
