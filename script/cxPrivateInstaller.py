#!/usr/bin/env python

#####################################################
# Unix setup script
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2014.07.14
#
#
#################################################             

import cxsetup.cxFindCustusX

import cx.script.cxInstallScript
import cxsetup.cxPrivateComponentAssembly

class Controller(cx.script.cxInstallScript.Controller):
    '''
    Installer script for CustusX - containing all SINTEF-private components
    '''
    def __init__(self, assembly=None):
        ''                
        assembly = cxsetup.cxPrivateComponentAssembly.LibraryAssembly()
        super(Controller, self).__init__(assembly)

if __name__ == '__main__':
    controller = Controller()
    controller.run()


