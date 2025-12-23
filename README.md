*This project has been created as part of the 42 curriculum by yanlu.*

# Description
This project creates a virtual machine (VM), sets up an operating system (OS) and implements certain rules in it.

# Instructions


# Project description
## Virtual Machine
A **Virtual Machine (VM)** is a virtual representation or emulation of a physical computer that uses software instead of hardware to run programs and deploy applications. With VMs, one can run multiple machines (with potentially different operating systems and applications) virtually on a single device.

VMs use **virtualization**, which is the process of creating software-based or virtual versions of resources (e.g. compute, storage, networking, servers) or applications.

Advantages of VMs:
- Cost and energy saving: Reduce cost for buying and maintaining physical infrastructure (server or machine) and reduces energy consumption.
- Agility and flexibility: Easy to set up new ones for testing or for increasing workload.
- Portability: Can be easily moved to another host and thus, allows more efficient workload allocation and lowers down time.
lower down time: can be easily moved to another host
- Security: Possible to restore to pre-infected state using snapshot or quickly delete and re-create an infected VM. Isolated VMs limits the risks of propagation in case of malware intrusion.

Common VM use cases:
- Cloud-based computing
- Speed workload migration (from local to cloud-based settings)
- Run incompatible software
- Testing new OS
- Investigate malware
- Support disaster recovery (recover data and prevent business disruption in cases like equipment failures and cyberattacks)

Source:
- [What is a virtual machine (VM)?](https://www.ibm.com/think/topics/virtual-machines)

## Choice of hypervisor (VirtualBox vs. UTM)
A **hypervisor** (or **virtual machine monitor (VMM)**) is a software that creates and runs one or more virtual machines.
It performs the virtualization layer, i.e. it controls the resources of the host machine, allocates to each VM the resources it needs, and makes sure that these VMs do not interfere with each other.

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

**The subject requires using VirtualBox.**

Source:
- [VirtualBox documentation](https://www.virtualbox.org/wiki/Documentation)
- [UTM documentation](https://docs.getutm.app/)
- https://www.howtogeek.com/virtualbox-vs-utm-which-is-best-for-linux-vms-on-mac/
- https://siit.co/blog/mac-virtual-machines-virtualbox-vs-utm/32587

## Choice of operating system (Debian vs. Rocky Linux)

|                    |  Debian  |  Rocky Linux  |
|--------------------|----------|---------------|
|Free and open source|  ✅ | ✅ |
|Stability           | More stable | Stable |
|Security            | Regular security updates, uses AppArmor by default but also supports SELinux | Enterprise-level, closer integration of SELinux|
|Hardware support    | Extensive, supports many architectures and devices | Broad hardware compatibility |
|Upgrades            | Easy (new version or single package) | No in-place upgrades, need to reinstall to move to the next major version |
|Extendability       | Base for many popular Linux distributions, e.g. Ubuntu | Based on Red Hat Enterprise Linux (RHEL)|
|Software            | Huge number of software packages | Packages more tailored to the server market |
|Package manager     | apt, aptitude | yum, dnf |
|Customization       | More options | Comparably less options |
|Usage               | Better for general purposes | More tailored to server use |

### Security module (AppArmor vs. SELinux)
The **Linux Security Module (LSM)** is a software framework that provides a mechanism for various security checks for the Linux kernel.

**Mandatory access control (MAC)** is a type of access control security policy. It is a system-enforced method of restricting access to objects based on the sensitivity of the object and the clearance of the user. Basically there is a set of rules which decides who gets access to what. This prevents unauthorized information sharing, because the policy cannot be overwritten by users. This is in contrast with discretionary access control (DAC), which was traditionally used by Linux and UNIX systems, where access control is enforced by individual file owners rather than by the system, therefore users have the ability to change permissions on their own files.

**AppArmor** is the default MAC LSM used in Debian. It uses path-based rules, i.e. it assigns rules to file paths. This makes it easier to configure and is ideal for cases where usability and ease of management is a priority.

**Security-Enhanced Linux (SELinux)** is also a MAC LSM, used in Rocky Linux. It uses a label-based model, which assigns rules to security contexts and object labels. This offers more granular control, making it preferred in enterprise and high-security environments.

### Firewall (UFW vs. firewalld)
A **firewall**

**UFW (Uncomplicated Firewall)**


### Package manager (apt vs. aptitude vs. yum/dnf)
A package manager helps handle the dependencies and configuration files of packages automatically so that they are installed/updated/removed properly.

**apt (Advanced Packaging Tool)** is the default command-line package manager in Debian. It uses the `.deb` package format. It is reliable and efficient and has the largest software repositories.

**aptitude** is a higher level package manager that uses `apt` under the hood and has to be installed separately. It has both command-line and text-based visual interfaces. It will automatically remove eligible packages (packages that are only installed as dependencies), whereas `apt` requires a separate command (`autoremove`) to do so. It will suggest potential resolutions in case of conflicts, while `apt` will not.

**dnf** is the successor of **yum** and is the default package manager in Rocky Linux. It uses the `.rpm` package format. It has automatic metadata refresh (`apt` requires running the `update` command manually) and supports rich dependency solving and rollback via history.

<br/>

**The subject recommends using Debian, and this is what the current VM will use.**

Source:
- [Reasons to use Debian](https://www.debian.org/intro/why_debian)
- [Rocky Linux guides](https://docs.rockylinux.org/10/guides/)
- https://amadla.medium.com/debian-linux-vs-rocky-os-exploring-the-best-choice-for-your-server-dfd6b3d80c1a
- https://computingforgeeks.com/debian-11-vs-debian-10-vs-rocky-linux-8-comparison-table/
- [Linux Security Module Usage](https://docs.kernel.org/admin-guide/LSM/index.html)
- [IBM documentation on Mandatory Access Control](https://www.ibm.com/docs/en/aix/7.2.0?topic=security-mandatory-access-control)
- [GeeksforGeeks tutorial on Mandatory Access Control](https://www.geeksforgeeks.org/ethical-hacking/mandatory-access-control/)
- [AppArmor](https://apparmor.net/)
- [What is SELinux?](https://www.redhat.com/en/topics/linux/what-is-selinux?)
- https://tuxcare.com/blog/selinux-vs-apparmor/
- https://blog.packagecloud.io/know-the-difference-between-apt-and-aptitude/
- https://www.linuxjournal.com/content/debian-package-management-aptitude-vs-apt-get-ubuntu
- https://www.makeuseof.com/apt-vs-dnf-vs-yum/
- https://opensource.com/article/21/7/dnf-vs-apt
- https://linuxblog.io/linux-package-managers-apt-dnf-pacman-zypper/


## Design choices
### Partitioning

### Security policy

### User management

`sudo` gives another user administrative access to the system.

### Services installed

# Resources
- [Official website of Debian](https://www.debian.org/)
- [Ubuntu Software Management documentation](https://help.ubuntu.com/community/SoftwareManagement)


https://www.markdownguide.org/extended-syntax/#formatting-text-in-tables
AI was not used for this project.
