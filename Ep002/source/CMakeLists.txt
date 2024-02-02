cmake_minimum_required(VERSION 3.5)
project(HelloApp
       VERSION 0.0.1
       DESCRIPTION "The leading Hello World App"
       LANGUAGES CXX )

# List your sources by using GLOBING OR Target so you to comment befor genaretion building files

# ----- GLOBING
#file(GLOB_RECURSE SOURCE_FILES src/*.cpp)
#add_executable(HelloApp main.cpp ${SOURCE_FILES})


# ------- Target
add_executable(HelloApp main.cpp
              src/dog.cpp
              src/operations.cpp)

target_compile_features(HelloApp PRIVATE cxx_std_23)
target_include_directories(HelloApp PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

  
