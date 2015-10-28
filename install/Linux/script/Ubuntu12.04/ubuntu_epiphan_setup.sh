#!/bin/bash

#####################################################
# Ubuntu setup script
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2012.05.19
#
# Description:
#	Install the epiphan vga2usb driver as a kernel module.
#       Based on the Fedora install script of the same name.
#
# NOTE: 
#   The script assumes that the driver files from epiphan are available in
#   the vga2usb/kernel-version folder. One folder for each kernel version.
#   Drivers are available from 
#      http://www.epiphan.com/downloads/linux
#
#####################################################

set -x
KERNEL_VERSION=`uname -r`
USER=`whoami`
#DRIVER_FILE_NAME="vga2usb/"$KERNEL_VERSION"/vga2usb.ko"

DRIVER_FOLDER_NAME=vga2usb/ubuntu-$KERNEL_VERSION
DRIVER_FILE_NAME=`find $DRIVER_FOLDER_NAME -name vga2usb*.deb`
#sudo dpkg -i vga2usb-3.27.2.3-ubuntu-3.2.0-24-generic-x86_64.deb
#sudo dpkg -i $(find ubuntu-`uname -r` -name vga2usb*.deb)

echo "===== epiphan setup init ====="

if [ ! -e $DRIVER_FILE_NAME ] ; then
	echo "Requirement: A folder named $DRIVER_FOLDER_NAME exists"
	echo "             and contains an epiphan debian package.     "
	echo "Epiphan install FAILED. "
	exit
fi

#install debian package ... not tested - might need to use more stuff from Fedora installer as well. Test.
sudo dpkg -i $DRIVER_FILE_NAME

# ---------------------------------------------------
# Setup access rights for current user
# ---------------------------------------------------
sudo usermod -a --groups uucp,dialout,video ${USER}
# ---------------------------------------------------

echo "===== epiphan setup completed! Please log out and in again. ====="
echo ""
echo ""

