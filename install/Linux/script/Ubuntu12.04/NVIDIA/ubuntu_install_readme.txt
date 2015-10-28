###########################################################
#
# Ununtu installation howto
#
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2012.05.19
#
# Copyright 2012 SINTEF Medical Technology
#
# Description:
#
#   Description of how to install CustusX on an
#   Ubuntu 12.04 OS.
#
###########################################################

===========================================================
Run the following scripts after install:
===========================================================

ubuntu_install_packages.sh
git_setup.sh
programmer_setup.sh
ubuntu_enable_hibernate.sh (not required)
install_github_key.sh (not in git - use own script or manually)
ubuntu_ndi_setup.sh
ubuntu_epiphan_setup.sh
cxInstaller.py --full --all -j8 -t Debug --isb_password=<password>

===========================================================
Notes:
===========================================================

 * nvidia, opencl and sudo work out of the box
 * nvidia : settings->Additional Drivers: Activate post-release updates.
 * Several other proprietary stuff work too: Flash etc.
 * The ubuntu_enable_hibernate solve a 'feature' in 12.04. 
   Might resolve itself.
 * ubuntu_install_packages.sh contains most of the know-how 
   of installing the right stuff. Add all interesting packages
   here.
 * Insert into Eclipse (no .deb for this): 
   http://cmakeed.sourceforge.net/eclipse/

===========================================================
Nice links:
===========================================================

https://help.ubuntu.com/community/SwitchingToUbuntu/FromLinux/RedHatEnterpriseLinuxAndFedora

Bruk scanelf til å finne symbol på maskina:
http://blog.flameeyes.eu/2008/11/misguided-link-and-as-needed

Unity howto:
http://arstechnica.com/information-technology/2011/05/riding-the-narwhal-ars-reviews-unity-in-ubuntu-1104/2/

