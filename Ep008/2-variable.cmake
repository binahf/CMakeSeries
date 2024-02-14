# ======= How to Set Up Variable in CMake?
#[=[ Variable may only contain alpanumeric charactes and underscores:
In CMake, you can set up variables using the `set` command. There are two types of variables: normal variables and cache variables. Normal variables are meant for internal script use, while cache variables can be persisted between CMake runs. To set a variable, use the following syntax:
set(MY_VARIABLE "value") You can access the variable using `${MY_VARIABLE}`. 
If you want to set a cache variable, use the `CACHE` keyword:
set(MY_CACHE_VARIABLE "value" CACHE STRING "Description of the variable")
#]=]



set(my_name "Lomdo")
set(var_1 "Text")
set([[var2]] "Text2")
set("var3" "Text3")

message(My\ name\ is\ ${my_name}) # here slash acte like space.
message(${var_1})
message(${var2})
message(${var3})  

# The bracket and quoted syntax allows spaces within variable names, but it's a bad practice and I won't expore that futher.#

#[=[ # uncomment before testing  I comment to keep the learning environment clean 
#variable references
set(one abc) # abc
set(two ${one}de) # abcde
set(three ${two} fg) # abcde;fg
set(four thre) # thre
set(five ${${four}e}) # abcde;ef

message(${one})
message(${two})
message(${three})
message(${four})
message(${five})      #]=]

#[=[ ====== Environment variables
Environmental variables in CMake provide a way to access and utilize system-specific information during the configuration process.
Your enviroment variables will affect the runing cmake instance. But the won't affect the system.
In CMake, you can access environment variables using the ENV operator and the syntax $ENV{VAR}. This allows you to read the value of the environment variable named VAR. Here's an example: ]=]

# Accessing the environment variable PATH
#message("Path: $ENV{PATH}") # Will print your system path

# You can also read enviroment variable from the system
#message($ENV{TMP})

#[=[ 
What is Cache Variable in CMake
In CMake, a cache variable is a special type of variable that is used to store persistent configuration information for a project. Cache variables are primarily employed for configuration settings where the first CMake run determines a suitable default value. These values persist across multiple runs within a project build tree.

The CMakeCache.txt file, created in the build directory when you run CMake, stores these cache variables. They are set during the build configuration process and can be accessed and modified using CMake commands.

Cache variables are particularly useful for expressing customized options, providing default values, and respecting user-specified values. They play a crucial role in maintaining configuration settings consistently throughout the development and build processe

Useful CMake Cache Variables
CMAKE_BUILD_TYPE: Specifies the build type (e.g., Debug, Release).

CMAKE_INSTALL_PREFIX: Sets the installation directory for the project.

CMAKE_CXX_STANDARD: Defines the C++ standard to use (e.g., 11, 14, 17).

CMAKE_C_FLAGS/CMAKE_CXX_FLAGS: Allows customizing compiler flags.

CMAKE_PREFIX_PATH: Specifies additional locations for finding dependencies.

CMAKE_MODULE_PATH: Adds directories to search for additional CMake modules.

BUILD_SHARED_LIBS: Determines whether to build shared or static libraries.

ENABLE_TESTING: Enables or disables testing for the project.

CMAKE_FIND_ROOT_PATH: Sets the root path for finding external dependencies.

CMAKE_VERBOSE_MAKEFILE: Controls the verbosity of the generated build files.

These cache variables provide flexibility and customization options during the CMake configuration process. Adjusting these variables allows developers to tailor the build according to their specific requirements.

#]=]


