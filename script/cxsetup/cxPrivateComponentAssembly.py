#!/usr/bin/env python

#####################################################
# Unix setup script
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2013.05.27
#
# Description:
#
#
#################################################             

import platform

import cx.build.cxComponents
import cx.build.cxComponentAssembly
import cxPrivateComponents
import cx.build.cxInstallData
import cx.utils.cxSSH

class PrivateControlData(cx.build.cxInstallData.Common):
    def __init__(self):
        ''
        super(PrivateControlData, self).__init__()
        
        self.main_branch = "develop"
        # for the build of NorMIT-nav on the custusx.org website
        user = "custusx"
        server = "sintefweb07.sintef.no"
        root_folder = 'uploads/normit/nav'
        self.publish_release_target                 = cx.utils.cxSSH.RemoteServerID(server, "%s/releases"%root_folder, user)
        self.publish_developer_documentation_target = cx.utils.cxSSH.RemoteServerID(server, "%s/developer_doc"%root_folder, user)
        self.publish_user_documentation_target      = cx.utils.cxSSH.RemoteServerID(server, "%s/user_doc"%root_folder, user) 
        self.publish_coverage_info_target           = cx.utils.cxSSH.RemoteServerID(server, "%s/gcov"%root_folder, user) 

        self.gitrepo_internal_site_base = "user@example.com/path/to/folder" #intended for use with "git checkout ssh://%s"
        self.gitrepo_open_site_base = "git@github.com:SINTEFMedtek"  

        self.system_base_name = "NorMIT-nav"

class LibraryAssembly(cx.build.cxComponentAssembly.LibraryAssembly):
    '''
    Contains all components
    '''
    def __init__(self):
        ''
        controlData = PrivateControlData()
        super(LibraryAssembly, self).__init__(controlData)

        self.addComponent(cxPrivateComponents.NorMITNavApp())

        self.libraries.remove(self.custusx)
        self.addComponent(self.custusx) # build cx last


        
        


