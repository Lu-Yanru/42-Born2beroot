*This project has been created as part of the 42 curriculum by yanlu.*

# Description
This project creates a virtual machine (VM), sets up an operating system (OS) and implements certain rules in it.

# Instructions


# Project description
## Choice of hypervisor
A **hypervisor** (or **virtual machine monitor (VMM)**) is a software that creates and runs one or more virtual machines.
It controls the recourses of the host machine, allocates to each VM the resources it needs, and makes sure that these VMs do not interfere with each other.

|          | VirtualBox            | UTM          |
|---------|-----------------------|--------------|
| Runs on | macOS, Linux, Windows | macOS, iOS   |
|         | --> cross platform support and better performance on Intel-based Macs | --> Better performance on Apple silicon Macs |
| Free and open source <br/> (personal use) | ✅ | ✅ |
| Linux compatibility | Broad compatibility with various Linux distributions | Supports less Linux distributions |
| Resource use | Higher | Lower |
| Graphic virtualization | ✅   | ❌ |
| Advanced features | Feature-rich, e.g. snapshots, shared folders, seamless mode etc. | Fewer features, no seamless mode or advanced guest OS support |
| Ease of use | More complex | Simpler |

This project uses VirtualBox.

Information based on:
- [VirtualBox documentation](https://www.virtualbox.org/wiki/Documentation)
- [UTM documentation](https://docs.getutm.app/)
- https://www.howtogeek.com/virtualbox-vs-utm-which-is-best-for-linux-vms-on-mac/
- https://siit.co/blog/mac-virtual-machines-virtualbox-vs-utm/32587

## Choice of operating system (Debian vs. Rocky Linux)
Debian 

- Debian is easier to update when a new version is released.
- Debian is more user-friendly and supports many libraries, filesystems and architechture. It also has more options for customisation.

The subject recommends using Debian, and this is what the current VM will use.

Information based on:
- [Reasons to use Debian](https://www.debian.org/intro/why_debian)

AppArmor vs. SELinux
UFW vs. firewalld

## Design choices
### Partitioning

### Security policy

### User management

### Services installed

# Resources
- [Official website of Debian](https://www.debian.org/)
- [Tutotial for static variables](https://www.geeksforgeeks.org/c/static-variables-in-c/)


https://www.markdownguide.org/extended-syntax/#formatting-text-in-tables
AI was not used for this project.