#!/bin/bash

# architecture
arc=$(uname -a)

# physical processors
cpup=$(grep "physical id" /proc/cpuinfo | uniq | wc -l)

# virtual processors
cpuv=$(grep "^processor" /proc/cpuinfo | uniq | wc -l)

# RAM useage
ram_used=$(free --mega | awk '$1 == "Mem:" {print $3}')
ram_total=$(free --mega | awk '$1 == "Mem:" {print $2}')
ram_percent=$(free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# disk usage
disk_used=$(df -BMB | grep "^/dev/" | grep -v '/boot$' | awk '{used += $3} END {print used}')
disk_total=$(df -BGB | grep "^/dev/" | grep -v '/boot$' | awk '{total += $2} END {print total}')
disk_percent=$(df -BMB | grep "^/dev/" | grep -v '/boot$' | awk '{used += $3} {total += $2} END {printf("%d"), used/total*100}')

# CPU load
cpu_load=$(top -bn1 | grep "^%Cpu" | cut -c 9- | xargs | awk '{printf("%.1f"), $1 + $3}')

# last reboot
last_reboot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# LVM
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)

# TCP connections
tcpc=$(ss -ta | grep ESTAB | wc -l)

# user log
ulog=$(users | wc -w)

# network
ip=$(ip address | grep "enp" | grep "inet" | awk '{print $2}' | cut -d / -f1)
mac=$(ip link show | grep "ether" | awk '{print $2}')

# sudo
sudon=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# broadcast message to all
wall "  #Architechture: $arc
    #CPU physical : $cpup
    #vCPU : $cpuv
    #Memory Usage: $ram_used/${ram_total}MB ($ram_percent%)
    #Disk Usage: $disk_used/${disk_total}Gb ($disk_percent%)
    #CPU load: $cpu_load%
    #Last boot: $last_reboot
    #LVM use: $lvmu
    #Connections TCP : $tcpc ESTABLISHED
    #User log: $ulog
    #Network: IP $ip ($mac)
    #Sudo : $sudon cmd"
