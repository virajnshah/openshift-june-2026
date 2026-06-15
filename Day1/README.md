# Day 1

## Info - Hypervisor Overview
<pre>
- is nothing but virtualization technology
- two types of hypervisors
  1. Type 1 a.k.a Bare Metal Hypervisor
     - is used in Workstations/Servers
     - can expect near-native performance
     - 3% overhead
     - the OS the runs inside a Virtual Machine is called Guest OS
     - Guest OS can be Windows, Linux or Mac OS
     - there is no Host OS Layer, in case of Type 1 Hypervisor
     - the Guest OS is a fully functional Operating System with its own dedicated OS Kernel
     - each Guest OS, gets its own dedicated hardware resources
       - CPU Cores ( virtual/logical CPU cores )
       - RAM ( Actual )
       - Storage ( Actual )
     - is called heavy-weight virtualization as every VM requires dedicated H/W resources
     - examples
       - Microsoft Hyper-V ( comes with Server grade Windows OS )
       - Linux KVM ( Opensource & Free )
       - VMWare vSphere(vcenter) - Commercial license required
  
  2. Type 2 a.k.a Hosted Hypervisor
     - is used in Desktops/Workstations/Laptops
     - the OS that runs inside a Virtual Machine is called Guest OS 
     - Guest OS can be Windows, Linux or Mac OS
       - each Guest OS, gets its own dedicated hardware resources
       - CPU Cores ( virtual/logical CPU cores )
       - RAM ( Actual )
       - Storage ( Actual )
     - is called heavy-weight virtualization as every VM requires dedicated H/W resources
     - examples
       - VMWare Fusion ( Mac OS-X )
       - VMWare Workstation - Free ( Linux & Windows )
       - Parallels ( Mac OS )
       - Oracle VirtualBox - Free ( Windows, Linux & Mac )
</pre>
