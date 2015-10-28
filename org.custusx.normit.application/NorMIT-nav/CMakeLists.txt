###########################################################
##
##               NorMIT-nav Application
##
###########################################################

qt5_add_resources(normit_nav_resources
    normit_nav.qrc
)

set(SOURCES
    cxMain.cpp
    ${normit_nav_resources}
)


set(CX_COPYRIGHT_TEXT "Copyright SINTEF Medical Technology. All rights reserved")

# additions to defaults from cx_initialize_macosx_bundle()
if(APPLE)
    set(ICNS_FILE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/icons/normit/NorMIT.icns)
	# For Apple set the icns file containing icons
	set_source_files_properties(${ICNS_FILE_PATH}
								PROPERTIES MACOSX_PACKAGE_LOCATION Resources)  # set where in the bundle to put the icns file
	set(SOURCES ${SOURCES} ${ICNS_FILE_PATH})  # include the icns file in the target
	set(MACOSX_BUNDLE_ICON_FILE "NorMIT.icns") # set how it shows up in the Info.plist file
	set(MACOSX_BUNDLE_COPYRIGHT ${CX_COPYRIGHT_TEXT})
endif(APPLE)

#------------------------------------------------------------------------------
# Executable
#-----------------------------------------------------------------------------
if(APPLE)
    add_executable(NorMIT-nav MACOSX_BUNDLE ${SOURCES} ) #APPLE
else(APPLE)
    if(CX_WINDOWS)
        add_executable(NorMIT-nav ${SOURCES} CustusX.rc) #WINDOWS
        set_target_properties(NorMIT-nav PROPERTIES LINK_FLAGS    "/MANIFESTUAC:\"level='asInvoker' uiAccess='false'\"")
    else()
        add_executable(NorMIT-nav ${SOURCES} ) #LINUX
    endif()
endif(APPLE)

#------------------------------------------------------------------------------
# Linking
#------------------------------------------------------------------------------

target_link_libraries(NorMIT-nav
    PRIVATE
    cxGui
	cxLogicManager
    cxGUIExtenderService
	cxPluginUtilities
    ${SSC_GCOV_LIBRARY}
)

#------------------------------------------------------------------------------
# Install CustusX
#------------------------------------------------------------------------------

install(TARGETS NorMIT-nav
    BUNDLE DESTINATION ${CX_INSTALL_ROOT_DIR}
    RUNTIME DESTINATION ${CX_INSTALL_ROOT_DIR}/bin
)

message(STATUS "Configuring application NorMIT-nav...")

