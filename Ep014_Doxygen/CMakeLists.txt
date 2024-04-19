cmake_minimum_required(VERSION 3.25)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(Dependencies)

enable_testing()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

add_subdirectory(src)

add_executable(rooster main.cpp)
target_link_libraries(rooster PRIVATE calculator)

add_subdirectory(test)

add_subdirectory(docs)