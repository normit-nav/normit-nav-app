#!/bin/bash

#####################################################
# Ubuntu setup script
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2012.05.19
#
# Description:
#
#   Perform NDI setup necessary for CustusX to work
#   with NDI tracking systems.
#	
#   The NDI Toolbox is also installed.
#	
#
#####################################################

set -x
USER=`whoami`

# ---------------------------------------------------
# Setup access rights for current user
# ---------------------------------------------------
# Alternative way to setup access for the ttyUSB port. 
# Add user to three groups.
# Follows description from NDI (readme file in NDIToolBox installation).	
sudo usermod -a --groups uucp,dialout ${USER}
# ---------------------------------------------------

# ---------------------------------------------------
# Setup connection between CustusX and IGSTK
# ---------------------------------------------------
# This is also performed by the CustusX installer (NA for Linux).
sudo mkdir -p /Library/CustusX/igstk.links
sudo chmod a+rwx /Library/CustusX/igstk.links
# ---------------------------------------------------


# ---------------------------------------------------
# Install the NDI Toolbox
# ---------------------------------------------------
NDI_TOOLBOX_INSTALLER_FILE_NAME="NDIToolBox_install.sh"
if [ ! -e $NDI_TOOLBOX_INSTALLER_FILE_NAME ] ; then
	echo "Error: NDI Toolbox archive not found. "
	echo "NDI Toolbox install FAILED. "
fi
chmod a+x $NDI_TOOLBOX_INSTALLER_FILE_NAME
./$NDI_TOOLBOX_INSTALLER_FILE_NAME -c
# ---------------------------------------------------


echo "===== NDI setup completed! ====="
echo ""
echo ""

