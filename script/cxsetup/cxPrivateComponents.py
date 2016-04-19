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
    def update(self):
        self._getBuilder().gitCheckoutDefaultBranch()    
    def configure(self):
        pass
    def build(self):
        pass
    def repository(self):
        # In the default case we override to use normit-nav instead of SINTEFMedtek on github:
        # otherwise use the main_site_base.
        if self.controlData.gitrepo_open_site_base == self.controlData.gitrepo_main_site_base:
            base =  'git@github.com:normit-nav' 
        else:
            base =  self.controlData.gitrepo_main_site_base  
        return '%s/normit-nav-app.git' % base   
    def makeClean(self):
        pass
    def pluginPath(self):
        return '%s/org.custusx.normit.application' % self.sourcePath()
    def addConfigurationToDownstreamLib(self, builder):
        add = builder.addCMakeOption
        add('CX_APP_CustusX:BOOL', 'OFF');
        add('CX_APP_NorMITNav:BOOL', 'ON');
        add('CX_OPTIONAL_CONFIG_ROOT:PATH', '%s/config'%self.sourcePath());
        add('CX_EXTERNAL_PLUGIN_org_custusx_normit_shared', '%s/org.custusx.normit.shared' % self.sourcePath())

class NorMITLib(cx.build.cxComponents.CppComponent):
    def name(self):
        return "normit-lib"
    def help(self):
        return 'Shared Library for NorMIT'
    def path(self):
        return '%s/%s' % (self.controlData.getWorkingPath(), self.sourceFolder())    
    def update(self):
        self._getBuilder().gitCheckoutDefaultBranch()    
    def configure(self):
        builder = self._getBuilder()
        add = builder.addCMakeOption
        builder.configureCMake()
    def repository(self):
        return 'git@github.com:normit-nav/normit-lib.git'   
    def makeClean(self):
        pass
    def addConfigurationToDownstreamLib(self, builder):
        add = builder.addCMakeOption
        add('NorMIT_DIR:PATH', '%s'%self.buildPath());

# ---------------------------------------------------------

