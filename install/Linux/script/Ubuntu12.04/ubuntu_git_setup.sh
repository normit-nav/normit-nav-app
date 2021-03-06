#!/bin/bash

#####################################################
# Ubuntu12.04 setup script
# Author: Janne Beate Bakeng, SINTEF Medical Technology
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2011.08.11
#         2013.12.03
#
# Description:
#
#    Install git.
#    Configure the git installation. 
#
#
#####################################################

#USER=`whoami`

echo "Configuring git installation..."

echo -e "Enter your name: \c "
read  NAME

echo -e "Enter your email: \c "
read  EMAIL

echo ""
set -x

sudo apt-get install -y git

git config --global core.editor "nano"
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.autocrlf input
#git config --global core.filemode false # (ONLY FOR WINDOWS)
git config --global alias.st status
git config --global push.default simple

echo "===== git setup completed! ====="
