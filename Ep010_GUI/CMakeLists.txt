cmake_minimum_required(VERSION 3.20)

project(Rooster)     

#[=[ 
The include command sets up a new variable scope. The OUR_PROJECT_VERSION variable is being set to: OUR_PROJECT_VERSION "Three" in stats/src/CMakeLists.txt file and set to OUR_PROJECT_VERSION "Two" in src/math/CMakeLists.txt file.
We will see output saying that the project version is "one" because the variables set in included files live in their own scope.
 #]=] 
set(OUR_PROJECT_VERSION "One") 

# Set up a cache variable named THE_SKY_IS_BLUE
set(THE_SKY_IS_BLUE "Yes" CACHE STRING "Is the sky blue?")

# The math library
add_subdirectory(src/math)

# The stats library 
add_subdirectory(src/stats)

# Set the source files to use
set(SOURCE_FILES
    src/main.cpp
)

function(create_and_link_executable EXEC_NAME LIB_NAME SOURCES)
    add_executable(${EXEC_NAME} ${${SOURCES}})
    target_link_libraries(${EXEC_NAME} PUBLIC ${LIB_NAME})
endfunction()


# # The executable target 
# add_executable(rooster src/main.cpp)
# target_link_libraries(rooster PUBLIC libstats)

create_and_link_executable(rooster libstats SOURCE_FILES)
message("Our project version is ${OUR_PROJECT_VERSION}")
message("Custom message: The compiler we'are using is ${CMAKE_CXX_COMPILER}")
message("The processor architecture is $ENV{PROCESSOR_ARCHITECTURE}")
message(${THE_SKY_IS_BLUE})

