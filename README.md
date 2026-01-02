*This project has been created as part of the 42 curriculum by yanlu.*

# Description
This project creates a virtual machine (VM), sets up an operating system (OS) and implements certain rules in it.

# Instructions
To retrieve the signature of the VM, navigate to the folder where the VM is installed. The defualt folders are:

- Windows: `%HOMEDRIVE%%HOMEPATH%\VirtualBox VMs\`
- Linux: `~/VirtualBox VMs/`
- MacM1: `~/Library/Containers/com.utmapp.UTM/Data/Documents/`
- MacOS: `~/VirutalBox VMs/`

The retrieve the signature from the `.vdi` file (or `.qcow2` for UTM) of the VM in `sha1` format:

- Windows: `certUtil -hashfile <machinename>.vdi sha1`
- Linux: `sha1sum <machinename>.vdi`
- MacM1: `shasum <machinename>.utm/Images/disk-0.qcow2`
- MacOS: `shasum <machinename>.vdi`

**SHA-1 (Secure Hash Algorithm 1)** is a hash function in cryptography. `sha1sum` is a computer program that calculates and verifies SHA-1 hashes.

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
An **operating system (OS)** is a layer of software that manages computer hardware and software resources and provides common services for computer programs. It allows the user application programs to interact with the system hardware.
The basic components of an OS architecture are:
- **Kernel**: The central component of an OS architecture. It acts as a bridge between software applications and hardware. It manages system resources, such as the CPU, memory and devices, and handles tasks like running programs, accessing files and connecting to external devices like printers and keyboards.
- **Shell**: The outermost layer of the OS and handles user interaction. It interprets input for the OS and handles the output from the OS.

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

Source:
- [Tutorial on Operating System - Architecture](https://www.tutorialspoint.com/operating_system/os_architecture.htm)
- [GeeksforGeeks Introduction to Operating system](https://www.geeksforgeeks.org/operating-systems/introduction-of-operating-system-set-1/)
- [Reasons to use Debian](https://www.debian.org/intro/why_debian)
- [Rocky Linux guides](https://docs.rockylinux.org/10/guides/)
- https://amadla.medium.com/debian-linux-vs-rocky-os-exploring-the-best-choice-for-your-server-dfd6b3d80c1a
- https://computingforgeeks.com/debian-11-vs-debian-10-vs-rocky-linux-8-comparison-table/

### Security module (AppArmor vs. SELinux)
The **Linux Security Module (LSM)** is a software framework that provides a mechanism for various security checks for the Linux kernel.

**Mandatory access control (MAC)** is a type of access control security policy. It is a system-enforced method of restricting access to objects based on the sensitivity of the object and the clearance of the user. Basically there is a set of rules which decides who gets access to what. This prevents unauthorized information sharing, because the policy cannot be overwritten by users. This is in contrast with discretionary access control (DAC), which was traditionally used by Linux and UNIX systems, where access control is enforced by individual file owners rather than by the system, therefore users have the ability to change permissions on their own files.

**AppArmor** is the default MAC LSM used in Debian. It uses path-based rules, i.e. it assigns rules to file paths. This makes it easier to configure and is ideal for cases where usability and ease of management is a priority.

Check AppArmor status:

    sudo aa-status


**Security-Enhanced Linux (SELinux)** is also a MAC LSM, used in Rocky Linux. It uses a label-based model, which assigns rules to security contexts and object labels. This offers more granular control, making it preferred in enterprise and high-security environments.

Source:
- [Linux Security Module Usage](https://docs.kernel.org/admin-guide/LSM/index.html)
- [IBM Mandatory Access Control](https://www.ibm.com/docs/en/aix/7.2.0?topic=security-mandatory-access-control)
- [GeeksforGeeks Mandatory Access Control](https://www.geeksforgeeks.org/ethical-hacking/mandatory-access-control/)
- [AppArmor](https://apparmor.net/)
- [What is SELinux?](https://www.redhat.com/en/topics/linux/what-is-selinux?)
- https://tuxcare.com/blog/selinux-vs-apparmor/

### Firewall (UFW vs. firewalld)
A **firewall** is a network security system that monitors and controls incoming and outgoing network traffic based on configurable security rules.

**iptables** is a generic firewall software that allows users to define rules for controlling network traffic, and provides packet filtering, network address translation (NAT) and other packet mangling.

**nftables** is the successor of `iptables` and is the current default firewall framework in Debian. It manages the different tools in the `iptables` family with a single tool and simplifies IPv4/IPv6 administrations. There are also no more pre-defined tables and base chains like in `iptables` but they are fully configurable.

**UFW (Uncomplicated Firewall)** is a frontend for `iptables` and `nftables` with a command-line interface and is commonly used in Debian. It is lightweight and easy to use.

**firewalld** is also a frontend for `iptables` and `nftables` and is the default firewall management tool in Rocky Linux. It provides dynamic firewall management with sup complex rule sets like runtime configurations (temporary rules that are lost when the system or service restarts) and zones (different sets of rules for different types of network traffic, e.g. public, internal, trusted networks).

Source:
- [The netfilter project](https://www.netfilter.org/)
- [nftables Wiki](https://wiki.nftables.org/wiki-nftables/index.php/What_is_nftables%3F)
- https://www.pluralsight.com/resources/blog/software-development/linux-firewall-administration
- https://www.tecmint.com/manage-firewalld-and-ufw-on-linux/
- [Red Hat Documentation: Using and configuring firewalld](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/configuring_firewalls_and_packet_filters/using-and-configuring-firewalld_firewall-packet-filters)

### Package manager (apt vs. aptitude vs. yum/dnf)
A package manager helps handle the dependencies and configuration files of packages automatically so that they are installed/updated/removed properly.

**apt (Advanced Packaging Tool)** is the default command-line package manager in Debian. It uses the `.deb` package format. It is reliable and efficient and has the largest software repositories.

**aptitude** is a higher level package manager that uses `apt` under the hood and has to be installed separately. It has both command-line and text-based visual interfaces. It will automatically remove eligible packages (packages that are only installed as dependencies), whereas `apt` requires a separate command (`autoremove`) to do so. It will suggest potential resolutions in case of conflicts, while `apt` will not.

**dnf** is the successor of **yum** and is the default package manager in Rocky Linux. It uses the `.rpm` package format. It has automatic metadata refresh (`apt` requires running the `update` command manually) and supports rich dependency solving and rollback via history.

Source:
- https://blog.packagecloud.io/know-the-difference-between-apt-and-aptitude/
- https://www.linuxjournal.com/content/debian-package-management-aptitude-vs-apt-get-ubuntu
- https://www.makeuseof.com/apt-vs-dnf-vs-yum/
- https://opensource.com/article/21/7/dnf-vs-apt
- https://linuxblog.io/linux-package-managers-apt-dnf-pacman-zypper/

<br/>

**The subject recommends using Debian, and this is what the current VM will use.**

## Design choices
### Partitioning
**Disk partitioning** is the process of dividing a disk into separate sections, each functioning as an independent disk. Partitioning helps managing files, running different operating systems on the same disk, or creating a dedicated space for specific data.

Following the subject, this project uses the **MBR format partitions**. MBR defines 3 types of partitions:
- Primary partition (sda1): The first level of partition on a disk. A disk can have up to 4 primary partitions
- Extended partition (sda2): A partition within a primary partition that acts as a container that can hold multiple logical partitions. It is not usable itself.
- Logical partition (sda5): A partition within an extended partition, allowing more than 4 partitions on a disk.

sda5 is further used as an LVM physical volume, which is further partitioned.

Unlike traditional storage management, where the storage space is managed on individual hard disk drives, the **Logical Volumn Manager (LVM)** manages the storage space by combining the capacity of the available hard disks or hard disk partitions (called physical volumes, PVs) into one or more volume groups (VGs). The VGs can then be subdivided into one or more logical volumes (LVs), which then are treated as traditional partitions. LVM allows easier scaling/resizing and reallocating of LVs.

**Mounting** makes file systems, files, directories, devices available for use at a particular location.
A **mount point** is a directory or file at which a new file system, directory or file is made accessible.
In this case, the mount point of a partition is the directory where the partition is attached, i.e. the partition can be accessed in this directory.

Common partitions, their mount points, their uses and their recommended sizes:

|Label |Mount point |Function        |Recommended size|
|-----|-----|----------------|----------------|
|root |/    |The root file system.|At least 700-850MB or 5-6GB for a workstation or a server installation. |
|sda1 |/boot|Static files of the boot loader, a program that is responsible for booting a computer and an OS| 256-512MB |
|swap |-- |If the system runs out of RAM, then it will transfer some of the lesser used data in RAM to this space. | As much as RAM, at least 512MB, usually at most 4GB.|
|home |/home|Users' home directories, containing saved files, personal settings etc. | Depending on planned usage and number of users, at least 100MB per user.|
|srv  |/srv |Data for services provided by the system, like data and scripts for web servers, data offered by File Transfer Protocol (FTP) servers, and repositories for version control systems. |Depend on planned usage. |
|tmp  |/tmp |Temporary data created by programs. Often not preserved between system reboots.|40-100MB, bigger if expected to temporarily store image files. |
|var  |/var |Variable data whose content is expected to continually change during normal opration of the system, like news articles, e-mails, web sites, databases, the packaging system cache etc. |2-3GB |
|var-log|/var/log|Log files. |Depend on planned usage. |


A **file system** determines how data is stored and retrieved. Debian recommends the file system ext4, which is the most commonly used one for Linux systems.

This project uses the recommended partition scheme by Debian.

Check partitions:

    lsblk

Source:
- [An Introduction to Disk Partitions](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/5/html/installation_guide/ch-partitions-x86#tb-partitions-types-x86)
- [Logical Volumn Manager (LVM) versus standard partitioning in Linux](https://www.redhat.com/en/blog/lvm-vs-partitioning)
- https://www.linuxjournal.com/content/mastering-linux-disk-management-lvm-and-disk-partitioning
- https://medium.com/@ahmedmansouri/understanding-disk-partitioning-in-linux-logical-volumes-vs-logical-partitions-796d46587d64
- [Mounting](https://www.ibm.com/docs/en/aix/7.3.0?topic=systems-mounting)
- [Debian Wiki Partition](https://wiki.debian.org/Partition)
- [Debian Recommended Partitioning Scheme](https://www.debian.org/releases/stable/arm64/apcs03.en.html)
- [Red Hat Recommended Partitioning Scheme](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/installation_guide/s2-diskpartrecommend-x86)

### Security policy
#### SSH
The **SSH (Secure Shell) Protocol** is a method for secure remote login from one computer to another with authentication and encryption.

It is typically used for providing secure access for users and automated processes, interactive and automated file transfers, issuing remote commands, and managing network infrastructure.

SSH works in the client-server model: The SSH client initiates the connection by contacting the server. The SSH servers sends back server public key to verify the identity of the server. Then the client and the server negotiate parameters and open encrypted channel and the user can login to the server host operating system.

The most common **authentication** methods are:
- Passwords
- Public key authentication (asymmetric encryption): There is a cryptographic key pair, public key and private key, and configure the public key on a server to authorize access and grant anyone who has a copy of the private key access to the server. This methods is primarily used for secure automation.

After the connection between the SSH client and server has been established, the transmitted data is **encrypted** using the following methods:
- Symmetric encryption: The client and server agree on a secret key to encrypt and decrypt messages.
- Hashing: Hash functions are made in a way that they don't need to be decrypted. Using the same hashing function and message should produce the same hash. SSH checks whether the hashes are the same to see if any portion of the data has been modified. Therefore, hashes are mainly used for data integrity purposes and to verify the authenticity of communication.

Install OpenSSH server, an open-source implementation of the SSH protocol:

    sudo apt install openssh-server

Check SSH status:

    sudo systemctl status ssh

or

    sudo service ssh status

As per instructed in the subject, the SSH service should run on port 4242. To do this, edit the SSH configuration file located at `/etc/ssh/sshd_config` and change `Port 22`(the default port) to `Port 4242`.

For security reasons, it must not be possible to connect using SSH as root. This prevents attackers from accessing the root remotely. To do this, set `PermitRootLogin` to `no`.

Restart SSH to apply the changes:

    sudo systemctl restart ssh

or

    sudo service ssh restart

Set up port forwarding in VirutalBox which redirect an available host port to the guest port (4242) and allows for SSH access to the virtual machine from the host system. Connect the <user> to the `localhost` machine on <hostport> via SSH:

    ssh <user>@localhost -p <hostport>

Quit the connection:

    exit

or

    logout

Source:
- [SSH Protocol - Secure Remote Login and File Transfer](https://www.ssh.com/academy/ssh/protocol)
- [Tutorial: Understanding the SSH Encryption and Connection Process](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)

#### Firewall
As per instructed in the subject, this project uses the UFW firewall and leaves only port 4242 open.

Install UFW:

    sudo apt install ufw

Enable firewall:

    sudo ufw enable

The default setting is to deny all incoming requests and allow all outgoing requests. Allow connection via port 4242:

    sudo ufw allow 4242

Check UFW status:

    sudo ufw status numbered

or for more details

    sudo ufw status verbose

Delete a rule:

    sudo ufw delete <rule_number>

or

    sudo ufw deny <port_number>

#### Password policy
Passwords protect user accounts and sensitive data from unauthorized access. It is therefore important to implement a strong password policy to prevent brute force attacks and security breaches related to weak passwords.

As per instructed in the subject, this project sets up a strong password policy as follows:

Edit the login definition file:

    sudo vim /etc/login.defs

The password expires every 30 days.

    PASS_MAX_DAYS 30

The minimum number of days between password changes is 2.

    PASS_MIN_DAYS 2

The user receives a warning message 7 days before their password expires.

    PASS_WARN_AGE 7

Ensure the policy changes applied to the current users:

    sudo chage -M 30 <username> # set PASS_MAX_DAYS to 30
    sudo chage -m 2 <username> #set PASS_MIN_DAYS to 2

Check password policy for a user:

    sudo chage -l <username>

Install the `libpam-pwquality` package to enforce password quality rules:

    sudo apt install libpam-pwquality

Edit the PAM (Pluggable Authentication Modules) configuration file:

    sudo vim /etc/pam.d/common-password

Add the following specifications after the line `password requisite pam_pwquality.so retry=3` (retry specifies the max number of incorrect attempts):

The password must be at least 10 characters long. Every additional character dramatically increased the number of guesses an attacker would need to try.

    minlen=10

It must contain minimum one uppercase letter:

    ucredit=-1 # + for maximum

It must contain minimum one lowercase letter:

    lcredit=-1

It must contain minimum one digit:

    dcredit=-1

It must not contain more than 3 consecutive identical characters:

    maxrepeat=3

The password must not include the name of the user:

    reject_username

The password must have at least 7 characters that are not part of the former password. This rule does not apply to the root password, because when you change the root password, it does not check for the old password.

    difok=7

Implement this password policy for root:

    enforce_for_root

Change the password for a user:

    sudo passwd <username>

Source:
- [National Institute of Standards and Technology (NIST) guidelines](https://pages.nist.gov/800-63-4/sp800-63b.html#appA)

### User management
#### sudo
This project uses `sudo` to allow other users to execute root commands.

**sudo (superuser do)** is a program designed to let system admins allow some users (users in the sudo group) to execute some commands as root (or any other user). This is safer than letting other users to use root directly, because `sudo` gives system admins more control over the access to root. Normal users don't need the root password. Extra privileges can be granted to individual users only temporarily, and usually, a normal user only needs to run certain root commands occasionally. This reduces the possibility of mistakes. Finally, when a `sudo` command is executed, the original username and the command are logged.

Installing `sudo`:

    su - #switch to root user
    apt install sudo

Reboot the machine to apply changes:

    sudo reboot

Display `sudo` version and configuration details to check if installation was successful:

    sudo -V

The subject requires the following configuration for `sudo`:

Set up a local `sudo` configuration file in the `/etc/sudoers.d/` folder:

    vim /etc/sudoers.d/sudo_config

Limit authentication to 3 attempts when the password is incorrect:

    Defaults  passwd_tries=3

A custom message to be displayed if an error occurs due to a wrong password:

    Defaults  badpass_message="Wrong password!"

Archive inputs and outputs using `sudo` in the `/var/log/sudo/` folder:

    mkdir /var/log/sudo # creates the folder

    Defaults  logfile="/var/log/sudo/sudo.log" # the log file
    Defaults  log_input, log_output # log both inputs and outputs
    Defaults  iolog_dir="/var/log/sudo" # the directory for the log file

The TTY (teletype) command displays information about the terminal currently connected to the standard input. When TTY mode is set, `sudo` must be run from a logged-in terminal session (a tty). This prevents `sudo` from being used from daemons (A program that runs as a background process, rather than being under the direct control of an interactive user.) or other detached processes like cron jobs or web server plugins. It also means that you can't run it directly from an SSH call without setting up a terminal session. Enable TTY mode:

    Defaults  requiretty

Restrict the paths that can be used by `sudo`:

    Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

`sudo` is in contrast with **su (switch user)** where you switch to a particular user (including root) directly.

To switch to a user while keeping the current environment:

    su <user>

To switch to a user including the user's environment variables:

    su - <user>

Keep <user> blank to switch to root.

Source:
- [Debian wiki sudo](https://wiki.debian.org/sudo)
- [Exploring the differences between sudo and su commands in Linux](https://www.redhat.com/en/blog/difference-between-sudo-su)
- https://stackoverflow.com/questions/67985925/why-would-i-want-to-require-a-tty-for-sudo-whats-the-security-benefit-of-requi

#### Groups
Create a new user:

    sudo adduser <username>

Verify whether the user was successfully created:

    getent passwd <username>

Verify user's password policy:

    sudo chage -l <username>

It's more efficient to group user accounts with similar access requirements than to manage permissions on a user-by-user basis. Only the users in the sudo group have `sudo` access.

Add a group:

    sudo addgroup user42

Add a user to groups:

    sudo usermod -a -G user42,sudo <user>

or

    sudo adduser <username> <groupname>

Check group and the users in them:

    getent group <groupname>

To enable `sudo` permission for a user, add the user to the sudo group. Then set the correct permissionf for sudoers file:

    chmod 0440 /etc/sudoers

Then reboot the system to apply changes.

Delete a user: `-f(orce)` deletes the account (including mail and home directory) even if the user is still logged in. `-r(emove)` deletes the account (including mail and home directory), but the user must be logged out.

    sudo userdel <username>

In the case of the message `user <username> is currently used by process <processid>` when trying to delete the user, first kill the process using the following command before deleting the user:

    pkill <processid>
    #or
    kill -9 <processid>

Source:
- [How to manage users and groups in Linux](https://www.redhat.com/en/blog/linux-user-group-management)

### System monitoring
The subject requires the creation of a monitoring script in `bash` that displays the following information:

Use `bash` as the command interpreter:

    #!/bin/bash

The architecture of the operating system and its kernel version:

    uname -a # -a = -all

The number of physical processors: In the file `/proc/cpuinfo`, count how many unique "physical id" there are.

    grep "physical id" /proc/cpuinfo | uniq | wc -l # The first part finds the lines containing the phrase "physical id" in the file /proc/cpuinfo. THe second part counts how many lines there are.

The number of virtual processors:

    grep "^processor" /proc/cpuinfo | uniq | wc -l # "^processor" matches expressions starting with "processor".

The current available RAM on the server and its utilization rate as a percentage: The `free` command display the amount of free and used memory in the system. The `--mega` option displays the unit in megabytes. `awk` is a text-processind and pattern-scanning tool. `$1 == "Mem:"` finds in the first column the rows that match "Mem:". `print $3` prints out the 3rd column.

    free --mega | awk '$1 == "Mem:" {print $3}' # used memory
    free --mega | awk '$1 == "Mem:" {print $2}' # total memory
    free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}' # percentage of used memory

The current available storage on the server and its utilization rate as a percentage: The `df` (disk free) command displays the file system disk usage on the mounted file system. The `-B<SIZE>` option displays the size in <SIZE> (e.g. GB for gigabytes, MB for megabytes). `grep "^/dev/"` finds the lines starting with "/dev/". These are the mounted storage devices/disks. `grep -v "/boot$"` excludes lines ending with "/boot", which is the partition containing the boot loader files. `awk '{used += $3} END {print used}'` get the sum of all the numbers in column 3 and prints it.

    df -BMB | grep "^/dev/" | grep -v "/boot$" | awk '{used += $3} END {print used}' # used disk
    df -BGB | grep "^/dev/" | grep -v "/boot$" | awk '{total += $2} END {print total}' # total disk
    df -BMB | grep "^/dev/" | grep -v "/boot$" | awk '{used += $3} {total += $2} END {printf("%d"), used/total*100}' # percentage of used disk

The current utilization rate of the processors as a percentage: The `top` command provides a dynamic real-time view of a running system. The `-b` option is to start `top` in batch mode to send output from `top` to other programs or files. In this mode, `top` will not accept input and runs until the iterations limit set with the `-n` open or until killed. The CPU usage information is in the line starting with "%Cpu". The `cut` command cuts out the CPU usage line starting from the 9th character. This leaves only the usage data itself without the title "%Cpu(s):". `xarg` turns the line into arguments delimited by space, which can be further processed by `awk`. `awk` sums the percentage of CPU time running user processes (us) and that of processes with a nice value (ni).

    top -bn1 | grep "^%Cpu" | cut -c 9- | xargs | awk {printf("%.1f"), $1 + $3}

The date and time of the last reboot: The `who` command prints information about users who are currently logged in. The `-b` option prints the time of last system boot.

    who -b | awk '$1 == "system" {print $3 " " $4}'

Whether LVM is active or not: The `lsblk` lists information about all available or the specified block devices (e.g. hard drives, SSDs and other storage related devices). Count how many lines contain "lvm" (as type). If there aren't any, print "no", otherwise print "yes".

    if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi

The number of active connections: **Transmission Control Protocal (TCP)** is a connection-oriented protocol for communications that helps in the exchange of messages between different devices over a network. Major internet applications such as the WWW, email, remote administration, file transfer and streaming media rely on TCP. The `ss` command displays information on sockets. The `-ta` options displays all TCP sockets. Use `grep` to get the established ones.

    ss -ta | grep ESTAB | wc -l

The number of users using the server: The `users` command prints the user names of users currently logged in to the current host. `wc -w` counts how many words are printed.

    users | wc -w

The IPv4 address of the server and its MAC (Media Access Control) address: An **IP address** is a unique numerical label assigned to each device connected to a computer network that uses the Internet Protocol (IP) for communication. The `ip` command shows information on routing, network devices, interfaces and tunnels. The `address` object shows the IP address on a device. Find the part named `enp` for ethernet, and find the part with `inet` for the IPv4 address. Select column 2 for the IP address itself and cut out the part before the `/` only, which is the IP address itself. The part after `/` is the port number. **MAC (Media Access Control)** is the layer that controls the hardware responsible for interaction with the wired or wireless transmission medium. It uses unique **MAC addresses** assigned to each device's network interface controller (NIC) for accurate data delivery within a local network. `ip link show` shows information on network devices.

    ip address | grep "enp" | grep "inet" | awk '{print $2}' | cut -d / -f1 # ip address
    ip link show | grep "ether" | awk '{print $2}' # MAC address

The number of commands executed with the `sudo` program: The `journalctl` command prints log entris from the system journal. `_COMM=sudo` filters the entries with only the file path "sudo" which is an executable script (thus `_COMM`).

    journalctl _COMM=sudo | grep COMMAND | wc -l

The **wall** command displays a message, or the content of a file or its standard input on the terminals of all currently logged in users. Syntax:

    wall [-n] [-t timeout] [-g group] [message | file]

Save the script under `/usr/local/bin/` so it is system-wide available and can be run anywhere.

**cron** is a shell command for scheduling a job (i.e. command or shell script) to run periodically at a fixed time, date, or interval. It can be used to automate repetitive task. The cron utility runs based on commands specified in a cron table (**crontab**). Each user, including root, can have a cron file. Edit the cron file to include new rules with:

    sudo crontab -u root -e # -u specifies the user, -e = edit

cron job syntax: `*` every, `,` value list separator, `-` range of values, `/` step values

| * | * | * | * | * | username | command to be executed |
|---|---|---|---|---|----------|------------------------|
|minute |hour | day of month | month | day of week | | |
|0-59 | 0-23 | 1-31 | 1-12 or JAN-DEC | 0-6 or SUN-SAT | | |

Execute monitoring script every 10 minutes:

    */10 * * * * bash /usr/local/bin/monitoring.sh

Source:
- [free Linux manual page](https://man7.org/linux/man-pages/man1/free.1.html)
- [awk tutorial](https://www.cyberciti.biz/faq/bash-scripting-using-awk/)
- [df Linux manual page](https://man7.org/linux/man-pages/man1/df.1.html)
- [GeeksforGeeks df tutorial](https://www.geeksforgeeks.org/linux-unix/df-command-linux-examples/)
- [top Linux manual page](https://man7.org/linux/man-pages/man1/top.1.html)
- [GeeksforGeeks Transmission Control Protocol - TCP](https://www.geeksforgeeks.org/computer-networks/what-is-transmission-control-protocol-tcp/)
- [ss Linux manual page](https://man7.org/linux/man-pages/man8/ss.8.html)
- [GeeksforGeeks What is an IP Address](https://www.geeksforgeeks.org/computer-science-fundamentals/what-is-an-ip-address/)
- [GeeksforGeeks MAC - Media Access Control](https://www.geeksforgeeks.org/computer-networks/mac-full-form/)
- [ip Linux manual page](https://man7.org/linux/man-pages/man8/ip.8.html)
- [Network devices naming scheme](https://www.freedesktop.org/software/systemd/man/latest/systemd.net-naming-scheme.html?__goaway_challenge=meta-refresh&__goaway_id=cf65f93141c06b92434a1c34ecfbfc58)
- [journalctl Linux manual page](https://man7.org/linux/man-pages/man1/journalctl.1.html)
- [wall Linux manual page](https://man7.org/linux/man-pages/man1/wall.1.html)
- [How I use cron in Linux](https://opensource.com/article/17/11/how-use-cron-linux)
- [cron schedule expression generator](https://crontab.guru/)
- [Regular Expressions](https://www.ibm.com/docs/en/controller/11.1.2?topic=codes-regular-expressions)

### Services installed
#### WordPress
**WordPress** is a free and open-source web content management system.
To run WordPress, a web server, a database management system, and PHP are required.

##### lighttpd
**lighttpd** is an open-source web server aiming to be light, secure and standards-compliant.

Install lighttpd packages:

    sudo apt install lighttpd

Check version, start, enable lighttpd and check status:

    sudo lighttpd -v
    sudo systemctl enable lighttpd
    sudo systemctl start lighttpd
    sudo systemctl status lighttpd

Open port 80 to connect to lighttpd services (http):

    sudo ufw allow 80
    sudo ufw status

Set up port forwarding in VirtualBox. The web server should now be accessible at `http://127.0.0.1:<hostport>` or `http://localhost:<hostport>`.

Source:
- [Debian wiki lighttpd](https://wiki.debian.org/Lighttpd)

##### MariaDB
**MariaDB** is a free and open-source database management system and is a community developed fork of MySQL.

Install MariaDB packages:

    sudo apt install mariadb-server mariadb-client

Secure the installation: This script guides you through important security settings like setting a root password (for the database), removing anonymous users, and disabling remote root login.

    sudo mariadb-secure-installation

Start, enable and check MariaDB status:

    sudo systemctl enable mariadb
    sudo systemctl start mariadb
    sudo systemctl status mariadb

Log into the MariaDB client entering the root (of the database) password:

    mariadb -u root -p

Create a database for WordPress:

    MariaDB [(none)]> CREATE DATABASE wp_database;

Create a new user who can only connect to the database from localhost:

    MariaDB [(none)]> CREATE USER <username>@localhost IDENTIFIED BY '<password>';

Grant the new user full privileges for `wp_database`:

    MariaDB[(none)]> GRANT ALL PRIVILEGES ON wp_database.* TO <username>@localhost;

Apply the privileges changes:

    MariaDB [(none)]> FLUSH PRIVILEGES;

Check all databases available on the server:

    MariaDB [(none)]> SHOW DATABASES;

Exit MariaDB:

    MariaDB [(none)]> exit

Source:
- [Install MariaDB](https://mariadb.com/get-started-with-mariadb/#linux)
- https://docs.vultr.com/how-to-install-mariadb-on-debian-12

##### PHP
**PHP** is a programming language geared towards web development.

Install PHP packages: `php-cgi` for using PHP with lighttpd. `php-mysql` for using PHP with databases. `apt` automatically installs all necessary dependencies.

    sudo apt install php-cgi php-mysql

Check PHP version:

    php -v

Enable PHP on the web server:

    lighttpd-enable-mod fastcgi fastcgi-php

Restart the web server to apply the changes:

    sudo systemctl restart lighttpd

To test PHP is working with lighttpd, create a file in `/var/www/html/` names `info.php`. In that file, write:

    <?php
    phpinfo();
    ?>

You should find a page with PHP information at `http://127.0.0.1:<hostport>/info.php`.

Source:
- [Installing from packages on Debian GNU/Linux and related distributions](https://www.php.net/manual/en/install.unix.debian.php)

##### Configuring WordPress
Install `wget` and `tar` to download files from the web and unpack them.

    sudo apt install wget tar

Move to `/var/www/html/`, the root of the web server. Delete any existing files in this directory.

    cd /var/www/html/
    rm *

Download the latest version of WordPress. Unpacks it and then deletes it.

    wget https://wordpress.org/latest.tar.gz
    tar -xzvf latest.tar.gz
    rm latest.tar.gz

Move WordPress files to the root directory and deletes the empty WordPress directory:

    sudo mv wordpress/* .
    rm -r wordpress/

Change permissions of the WordPress directory to grant rights to the web server:

    sudo chown -R www-data:www-data /var/www/html/ # changes the owner of the directory to www-data
    sudo chmod -R 755 /var/www/html/ # owner can read, write and execure, group and others can read and execute

Create the WordPress configuration file:

    sudo mv wp-config-sample.php wp-config.php

Edit the configuration file with database info set before. And finish setting up the website on `http://127.0.0.1:<hostport>` or `http://localhost:<hostport>`.

Source:
- [How to install WordPress](https://developer.wordpress.org/advanced-administration/before-install/howto-install/)

#### Netdata
**Netdata** is an open-source tool designed to visualize system monitoring data such as CPU usage, disk activity, bandwidth usage, website visits etc..

Install Netdata:

    sudo apt install netdata
    sudo systemctl enable netdata

Netdata operates on port 19999. Open this port and set up port forwarding in VirtualBox:

    sudo ufw allow 19999

Modify the configuration file in `/etc/netdata/netdata.conf` as needed.

The default dashboard can be viewed at `http://127.0.0.1:<hostport>`.

Source:
- [How to Set Up Real-Time Performance Monitoring with Netdata](https://www.digitalocean.com/community/tutorials/how-to-set-up-real-time-performance-monitoring-with-netdata-on-ubuntu-16-04)

# Resources
- [Official website of Debian](https://www.debian.org/)
- [Debian GNU/Linux Installation Guide](https://www.debian.org/releases/forky/armhf/index.en.html)
- [Ubuntu Software Management documentation](https://help.ubuntu.com/community/SoftwareManagement)
- [GeeksforGeeks Basics of Computer Networking](https://www.geeksforgeeks.org/computer-networks/basics-computer-networking/)
- [GeeksforGeeks What is Network Port?](https://www.geeksforgeeks.org/computer-networks/what-is-network-port/)
- [Mardown guide](https://www.markdownguide.org/)

AI was not used for this project.
