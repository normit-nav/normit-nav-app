
if(BUILD_TESTING)

    set(TEST_MOC_SOURCE
	)
    set(TEST_SOURCE
		nmtestSharedPlugin.h
		nmtestSharedPlugin.cpp
    )

    qt5_wrap_cpp(TEST_MOC_SOURCE ${TEST_MOC_SOURCE})
    add_library(cxtest_org_custusx_normit_shared ${TEST_SOURCE} ${TEST_MOC_SOURCE})
    include(GenerateExportHeader)
    generate_export_header(cxtest_org_custusx_normit_shared)
    target_include_directories(cxtest_org_custusx_normit_shared
        PUBLIC
        .
        ${CMAKE_CURRENT_BINARY_DIR}
    )
	target_link_libraries(cxtest_org_custusx_normit_shared
		PRIVATE
		org_custusx_normit_shared
		cxGui
		cxLogicManager
		cxCatch)
    cx_add_tests_to_catch(cxtest_org_custusx_normit_shared)


endif(BUILD_TESTING)
