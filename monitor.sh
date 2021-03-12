#! /bin/bash
# Monitor some stuff
# powered by uzcategui@gmail.com in Merida, Venezuela
#
# unset any variable which system may be using

# clear the screen
clear

unset temreset osrelease architecture kernelrelease internalip nameserver loadaverage

# Define Variable tecreset
temreset=$(tput sgr0)

#System Information
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)SYSTEM INFORMATION$temreset"

## Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4,$5}')
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)System Uptime Days/(HH:MM) :$temreset" $tecuptime

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $12 $13 $14}')
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Load Average :$(tput sgr 0)" $loadaverage

# Check Internal IP
internalip=$(hostname -I)
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Internal IP :$(tput sgr 0)" $internalip

# Check OS Release Version and Name
osrelease=$(cat /etc/os-release | grep PRETTY_NAME | cut -f2 -d\") 
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)OS Release Version :$(tput sgr 0)" $osrelease 

# Check Architecture
architecture=$(uname -m)
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Architecture :$(tput sgr 0)" $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Kernel Release :$(tput sgr 0)" $kernelrelease

# Users Logged
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)USERS LOGED IN SYSTEM$temreset"

# Check Logged In Users
who>/tmp/who
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Logged In users :$(tput sgr 0)" && cat /tmp/who 

# System Memory
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)SYSTEM MEMORY$temreset"

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Ram Usages :$(tput sgr 0)"  
cat /tmp/ramcache | grep -v "Swap"
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Swap Usages :$(tput sgr 0)"
cat /tmp/ramcache | grep -v "Mem"

# SYSTEM HDD
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)SYSTEM HDD$temreset"

# Check Disk Usages
df -h /dev/sda1 /dev/sda6 > /tmp/diskusage
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Disk Usages :$(tput sgr 0)"  
cat /tmp/diskusage

# System Temperature
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)SYSTEM TEMPERATURE$temreset"

# MOBO,CPU & HDD Temp
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)MOBO & CPU Temp$(tput sgr 0)"
sensors
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)HDD Temp$(tput sgr 0)"
hddtemp /dev/sda

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo "$(tput setaf 7)$(tput setab 1)$(tput bold)INTERNET:$(tput sgr 0) Connected" || echo "$(tput setaf 7)$(tput setab 1)$(tput bold)INTERNET:$(tput sgr 0) Disconnected"

# Unset Variables
unset temreset osrelease architecture kernelrelease internalip loadaverage

# Remove Temporary Files
rm /tmp/who /tmp/ramcache /tmp/diskusage

shift $(($OPTIND -1))
