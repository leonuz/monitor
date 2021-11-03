#! /bin/bash
# YAMPS it's a small bash Tput monitor program.
# allows to get information necessary to know a Linux system.
#

COLUMNS=`tput cols`
LINES=`tput lines`
line=`expr $LINES / 2`
column=`expr \( $COLUMNS - 6 \) / 2`

# unset any variable which system may be using
unset temreset osrelease architecture kernelrelease internalip externalip nameserver loadaverage

# Define HDD Variable (EDIT for your system)
hd1=(/dev/sda1)
parti=(/dev/mapper/sniperhack--vg-root)

# clear the screen
# First Page Title
clear
tput sc
tput cup $line $column
tput rev
echo 'YAMPS Monitor'
tput sgr0
tput rc
sleep 2

# clear the screen
clear

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

# Check External IP
externalip=$(curl -s ifconfig.co)
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)External IP :$(tput sgr 0)" $externalip

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
df -h $parti > /tmp/diskusage
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Disk Usages :$(tput sgr 0)"  
cat /tmp/diskusage

# System Temperature
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)SYSTEM TEMPERATURE$temreset"

# Motherboard,CPU & HDD Temp
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Motherboard & CPU Temp :$(tput sgr 0)"
sensors
echo "$(tput setaf 7)$(tput setab 4)$(tput bold)HDD Temp :$(tput sgr 0)"
hddtemp $hd1

# Check if connected to Internet or not
ping -c 1 1.1.1.1 &> /dev/null && echo "$(tput setaf 7)$(tput setab 1)$(tput bold)INTERNET:$(tput sgr 0) Connected" || echo "$(tput setaf 7)$(tput setab 1)$(tput bold)INTERNET:$(tput sgr 0) Disconnected"

# Unset Variables
unset temreset osrelease architecture kernelrelease internalip loadaverage

# Remove Temporary Files
rm /tmp/who /tmp/ramcache /tmp/diskusage

shift $(($OPTIND -1))
