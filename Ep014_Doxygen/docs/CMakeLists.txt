find_program(DOXYGEN_PATH doxygen REQUIRED)

if(DOXYGEN_PATH_NOTFOUND)
message(FATAL_ERROR "Doxygen is needed to buid the documentation. Please install it on your system")
else()
    message(STATUS "Doxygen found.")

    file(DOWNLOAD https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.3.1/doxygen-awesome.css ${CMAKE_CURRENT_LIST_DIR}/doxygen-awesome.css)
    file(DOWNLOAD https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.3.1/doxygen-awesome-sidebar-only.css ${CMAKE_CURRENT_LIST_DIR}/doxygen-awesome-sidebar-only.css)

    # add_custom_target(documentation COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/Doxyfile
    # WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    #                 BYPRODUCTIONS ${CMAKE_BINARY_DIR}/html/index.html)
    # add_custom_command(
    #     TARGET documentation POST_BUILD COMMAND echo "Documentation sucessfully genareted. You can preview at: ${CMAKE_BINARY_DIR}/html/index.html")
    set(DOXYGEN_GENARATE_HTML YES)
    set(DOXYGEN_HTML_OUTPUT ${CMAKE_BINARY_DIR}/html)
    set(DOXYGEN_TREEVIEW YES)
    list(APPEND DOXYGEN_EXTRA_STYLESHEET ${PROJECT_SOURCE_DIR}docs/doxygen-awesome.css)
    list(APPEND DOXYGEN_EXTRA_STYLESHEET ${PROJECT_SOURCE_DIR}/docs/doxygen-awesome-sidebar-only.css)

    doxygen_add_docs(documentation ${PROJECT_SOURCE_DIR}/src COMMENT "Genarating documentation")
endif()
