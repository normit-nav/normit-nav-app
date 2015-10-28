#!/bin/bash

#####################################################
# Ubuntu setup script
# Author: Christian Askeland, SINTEF Medical Technology
#         2014.09.09
#         2014.12.02
#
# Description:
#    Tweaks to make NVidia GeForce GTX 780 to work on Ubuntu 14.04
#    including openCL support
#
#####################################################

sudo update-pciids # causes lspci | grep -i nvidia  to report correct card

#Ubuntu 14.04 NVidia hacks - if driver is not present in "Additional drivers"
sudo add-apt-repository ppa:xorg-edgers/ppa -y
sudo apt-get -y update
sudo apt-get -y upgrade
#After this, you will see the drivers in System Settings -> Software update -> Additional Drivers

# install nvidia-modprobe in order to load the opencl driver automatically
# https://devtalk.nvidia.com/default/topic/734098/linux/-boinc-ubuntu-nvidia-no-usable-gpus-found-/
sudo apt-get -y nvidia-modprobe


# -----------------------------------------------------------------------------
# the rest of this file is obsolete (I hope) with the nvidia-modprobe fix
# -----------------------------------------------------------------------------


# http://mhr3.blogspot.no/2013/06/opencl-on-ubuntu-1304.html
# "you can install the OpenCL library/headers/package config files with a nice and quick `apt-get install ocl-icd-opencl-dev`, but doing that will probably just get you to CL_PLATFORM_NOT_FOUND_KHR (-1001) error from clGetPlatformIDs. That's because you do have the dispatcher, but no actual OpenCL drivers. Therefore I decided to play with the three major OpenCL implementations (Intel, AMD, NVidia)."


# Her er en oppskrift som fungerer på GTX780 + Ubuntu 14.04 den 2014-09-08:
# https://www.mail-archive.com/darktable-users@lists.sourceforge.net/msg04941.html

sudo apt-get install -y nvidia-343-dev nvidia-343-uvm
sudo apt-get install -y build-essential opencl-headers
sudo apt-get install -y nvidia-opencl-dev
#sudo apt-get install nvidia-libopencl1-343 # already installed
#sudo apt-get install nvidia-opencl-icd-343 # already installed
# it seemslike libOpenCL.so isnt available from nvidia ('apt-file search libOpenCL.so | grep nvidia') for version 343, use khronos icd instead:
sudo apt-get install -y ocl-icd-libopencl1 # installs libOpenCL.so

# if 'lsmod | egrep nvidia' doesnt contain uvm:
sudo modprobe nvidia-uvm

# then: run a program using opencl with SUDO
# running nvidia-modprobe -c0 -u might helpt, but this is not yet available in 14.04 (http://d3adbra1n.wordpress.com/2014/05/03/cuda-miner-installation-on-a-fresh-ubuntu-14-04-lts/)

# How to test:
# http://wiki.tiker.net/OpenCLHowTo





