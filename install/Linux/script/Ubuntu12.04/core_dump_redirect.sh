#!/bin/bash

#####################################################
# Unix setup script
# Author: Ole Vegard Solberg, SINTEF Medical Technology
# Date:   2013.01.18
#
# Not a part of the standard installation. Use if core dumps cannot be found (eg. redirected by some other program like on Ubuntu 12.04)
# This script don't have to be used on Ubuntu 14.04. Here it is enough to use the command: ulimit -c unlimited
#
# Description:	
#
# Set core files to be saved in a specific folder.
# Creates a redirect file: core_redirect.sh to be used by /proc/sys/kernel/core_pattern
# http://www.randombugs.com/linux/core-dumps-linux.html
# http://www.linuxquestions.org/questions/ubuntu-63/firefox-crashing-frequently-474728/
# http://stackoverflow.com/questions/6602176/core-dump-file-format
#
#
#####################################################

USER=`whoami`

echo "This script don't have to be used on Ubuntu 14.04. Here it is enough to use the command: ulimit -c unlimited"
echo "NB! For this to work on Fedora you also have to uninstall abrt with the command: sudo yum remove abrt*"
echo "And possibly also stop the abrt GUI from starting automatically: System|Preferences|Startup Applications"
echo ""
echo "--------------------------------------------------------------------------------------------------------"
echo ""

if [[ "$USER" != "root" ]] ; then
	echo "You must be root to run this script!"
	exit
fi

if [[ "$1" == "" ]] ; then
	echo "Usage: core_dump_redirect.sh <path_to_save_core_files>"
	exit
fi

mkdir -p $1
chmod -R 1777 $1

echo "#!/bin/sh" > $1/core_redirect.sh 
echo "cat > $1/core.\$1.\$2" >> $1/core_redirect.sh
chmod 1777 $1/core_redirect.sh

cp /proc/sys/kernel/core_pattern $1/core_pattern.old
#Not needed as sysctl seems to update this value
#echo "|$1/core_redirect.sh %e %p" > /proc/sys/kernel/core_pattern

echo "" >> /etc/sysctl.conf
echo "#Redirect core files" >> /etc/sysctl.conf
echo "kernel.core_pattern=|$1/core_redirect.sh %e %p" >> /etc/sysctl.conf

sysctl -w kernel.core_pattern="|$1/core_redirect.sh %e %p"
sysctl -p

echo "=== Core files are now stored in ["$1"]. ==="
echo ""

