project(org_custusx_normit_nav_application)

set(CUSTUSXSETUP_SOURCE_DIR ${PROJECT_SOURCE_DIR}/..)

###############################################################################
#
# Define variables used by various installer generators to customize
# the installer look&feel.
#
###############################################################################
macro(cxsetup_install_decorate_generators)

	set(CX_LICENSE_FILE "${CUSTUSXSETUP_SOURCE_DIR}/doc/NorMIT_license.txt")
	set_property(GLOBAL PROPERTY CX_LICENSE_FILE "${CX_LICENSE_FILE}")

	set_property(GLOBAL PROPERTY CPACK_RESOURCE_FILE_WELCOME "${CUSTUSXSETUP_SOURCE_DIR}/doc/install_text/install_welcome.txt")
	set_property(GLOBAL PROPERTY CPACK_RESOURCE_FILE_README "${CUSTUSXSETUP_SOURCE_DIR}/doc/install_text/install_readme.rtf")
	set_property(GLOBAL PROPERTY CPACK_RESOURCE_FILE_LICENSE "${CX_LICENSE_FILE}")
endmacro()

###############################################################################
#
# Install all configuration files required by CustusX
#
###############################################################################
function(cxsetup_install_configuration_files)


	install(DIRECTORY ${CUSTUSXSETUP_SOURCE_DIR}/config/
			DESTINATION ${CX_INSTALL_CONFIG_DIR}
			FILE_PERMISSIONS ${CX_FULL_PERMISSIONS}
			DIRECTORY_PERMISSIONS ${CX_FULL_PERMISSIONS})

endfunction()

###############################################################################
#
# Install all documentation files for CustusX
#
###############################################################################
function(cxsetup_install_documentation_files)
  #TODO
endfunction()


# Install Apple-specific files
#if(APPLE)
    # Install folder for storage of igstk<->CustusX symlinks.
    # The symlinks must be in an absolute location.
    # Apple only (Win uses COM-ports, Linux installs with OS)
    # Because CPACK_PACKAGING_INSTALL_PREFIX is "/", this will install
    # in /Library/CustusX.
#    install(DIRECTORY ${CUSTUSXSETUP_SOURCE_DIR}/install/Apple/igstk.links
#            DESTINATION Library/CustusX
#            FILE_PERMISSIONS ${CX_FULL_PERMISSIONS}
#            DIRECTORY_PERMISSIONS ${CX_FULL_PERMISSIONS}
#            )
#endif(APPLE)


#---------------------------------------------------------
#---------------------------------------------------------
message(STATUS "Configuring plugin org.custusx.normit.application...")

cxsetup_install_decorate_generators()
cxsetup_install_documentation_files()
cxsetup_install_configuration_files()

# add the application
cx_add_optional_app_subdirectory("NorMIT-nav")
#---------------------------------------------------------
#---------------------------------------------------------

