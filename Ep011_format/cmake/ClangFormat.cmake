# Define a function to create a custom target for running clang-format
function(add_clang_format_target TARGET_NAME SOURCE_DIR)
    find_program(CLANG_FORMAT_PATH clang-format REQUIRED)
    
    # Find all C++ source files in the specified directory
    file(GLOB_RECURSE FORMAT_SOURCES
        LIST_DIRECTORIES false
        "${SOURCE_DIR}/*.cpp"
        "${SOURCE_DIR}/*.h"
        # add other extension here
    )

    # Create a custom target to run clang-format
    add_custom_target(${TARGET_NAME}
        COMMAND ${CLANG_FORMAT_PATH} -i -style=file ${FORMAT_SOURCES}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} # Change this if needed
        COMMENT "Running clang-format on ${SOURCE_DIR} sources"
    )
endfunction()
