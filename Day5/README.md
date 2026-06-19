# Day 5

## Info - Microservice Overview
<pre>
- Microservice is an architectural style where application is built as a collection of small, 
  independent and loosely coupled services
- each microservice will be responsible for specific business logic
- microservice to microservice communications can be achieved with HTTP/REST, gRPC or message queues
- Key properties of Microservices
  - Single Responsibility
  - Can be deployed independently
  - Technology agnostic - can be developed using any language stack
  - Decentralized Database
  - Resilience - Failures in one service will not affect others or will not bring down the entire application
  - Scalability - every microservice can be scaled up/down independent of other microservices 
</pre>

## Info - Monolithic Application Overview
<pre>
- is a traditional application that is built as a single application binary
- all components will be bundled in the single application binary
  - Frontend
  - Business Layer
  - Data Access Layer
- Key properties of Monolithic applications
  - Single codebase
  - Tightly coupled components
  - Entire application is deployed as a single unit
  - Centralized Database
  - Scaling Limitations
</pre>
