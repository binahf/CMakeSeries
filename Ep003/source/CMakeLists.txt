cmake_minimum_required(VERSION 3.5)

# Here we comment the (target_compile_features(HelloApp PUBLIC cxx_std_23)
# Becose we set it up down below
set(CXX_STANDARD_REQUIRED ON) # We make C++23 a hard requirement
set(CMAKE_CXX_STANDARD 23) # We set Detfault C++ Standard for targets

project(HelloApp
       VERSION 1.0.0
       DESCRIPTION 
       "The leading Hello World App"
       LANGUAGES CXX )

add_library(operations STATIC src/operations.cpp)
target_include_directories(operations PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
#target_compile_features(operations PUBLIC cxx_std_23)

add_library(logger STATIC logger/src/log.cpp)
target_include_directories(logger PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/logger/include)



add_executable(HelloApp main.cpp
              src/dog.cpp)


target_include_directories(HelloApp PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
#target_compile_features(HelloApp PUBLIC cxx_std_23)
target_link_libraries(HelloApp PUBLIC operations logger)

  