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
        user = "custusx"
        server = "mtwiki.sintef.no"
        self.publish_release_target                 = cx.utils.cxSSH.RemoteServerID(server, "uploads/normit/nav/releases", user)
        self.publish_developer_documentation_target = cx.utils.cxSSH.RemoteServerID(server, "uploads/normit/nav/developer_doc", user)
        self.publish_user_documentation_target      = cx.utils.cxSSH.RemoteServerID(server, "uploads/normit/nav/user_doc", user)
        self.publish_coverage_info_target           = cx.utils.cxSSH.RemoteServerID(server, "uploads/normit/nav/gcov", user)
        self.gitrepo_internal_site_base = "ssh://mtwiki.sintef.no/storage/mtwiki/git" 

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


        
        


