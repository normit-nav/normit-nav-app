#!/bin/bash

#####################################################
# Ubuntu 12.04 terminal formater
# Author: Janne Beate Bakeng, SINTEF Medical Technology
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2011.08.04
#         2012.01.31
#	  2013.12.03
#
# Description:
#
#	Reformat the look and feel of the terminal prompt
#
#
#####################################################

# reformat prompt to a useful one:
PROMPT='
BLUE="\[\033[1;34m\]"
LIGHT_BLUE="\[\033[0;34m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_RED="\[\033[1;31m\]"
WHITE="\[\033[1;37m\]"
NO_COLOUR="\[\033[0m\]"
TITLEBAR="\[\033]0;\w\007\]"

export PS1="${TITLEBAR}\
$BLUE[$GREEN\$(date +%H:%M:%S) \
$GREEN\w$BLUE]\
$BLUE\$$NO_COLOUR "
PS2="> " # not exported yet
PS4="+ " # not exported yet
'
echo "$PROMPT" >> ~/.bashrc
echo "Changed prompt in .bashrc"

echo "===== Completed changing prompt! ====="

