#!/usr/bin/env python

#####################################################
# Unix setup script
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2012.01.19
#
# Description:
#
#             
#################################################             

import platform

import cx.build.cxComponents
import cxCustusXFinder
#import cx.cxShell

class NorMITNavApp(cx.build.cxComponents.CppComponent):
    def name(self):
        return "NorMITNavApp"
    def help(self):
        return 'Application for NorMIT-nav, wrapping CustusX'
    def path(self):
        return '%s/%s' % (self.controlData.getWorkingPath(), self.sourceFolder())    
    def sourceFolder(self):
        return cxCustusXFinder.RepoLocations().getPrivateRepoFolder()
    def _rawCheckout(self):
        self._getBuilder().gitClone(self.gitRepository(), self.sourceFolder())
    def update(self):
        self._getBuilder().gitCheckoutDefaultBranch()    
    def configure(self):
        pass
    def build(self):
        pass
    def gitRepository(self):
        base = self.controlData.gitrepo_internal_site_base
        return 'git@github.com:normit-nav/normit-nav-app.git'   
    def makeClean(self):
        pass
    def pluginPath(self):
        return '%s/org.custusx.normit.application' % self.sourcePath()
    def addConfigurationToDownstreamLib(self, builder):
        add = builder.addCMakeOption
        add('CX_APP_CustusX:BOOL', 'OFF');
        add('CX_APP_NorMITNav:BOOL', 'ON');
        add('CX_OPTIONAL_CONFIG_ROOT:PATH', '%s/config'%self.sourcePath());
        #add('CX_CUSTUS_SINTEF:BOOL', 'ON');
        #set (CX_OPTIONAL_CONFIG_ROOT ${CustusX_SOURCE_DIR}/../../CustusXSetup/CustusXSetup/config)


# ---------------------------------------------------------

