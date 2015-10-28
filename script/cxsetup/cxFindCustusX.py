#####################################################
# 
# Author: Christian Askeland, SINTEF Medical Technology
# Date:   2014.07.13
#
# Import at the beginning of a CustusXSetup script, 
# will checkout CustusX and connect to the scripts there.
#
#####################################################
     
import cxCustusXFinder

finder = cxCustusXFinder.CustusXFinder(silent=False)    
finder.checkoutMasterIfNotFound()
finder.addCustusXPythonScriptFolderToPath()
