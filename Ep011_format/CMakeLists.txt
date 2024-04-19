cmake_minimum_required(VERSION 3.25)
project(CustomTargets) # Replace with your project name

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(rooster main.cpp person.cpp) # Replace with your source files
target_include_directories(rooster PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} )

include(ClangFormat) # Not needed
add_clang_format_target(format-code ${PROJECT_SOURCE_DIR})    
#add_dependencies(rooster format-code) # this will automaticaly format after building rooster binary
 