# How to Install Catch2 on Windows System

To install Catch2 on a Windows system, you have several options:

1. **Manual Download:**

   - Head to [Catch2 GitHub Releases](https://github.com/catchorg/Catch2/releases).
   - Download the latest release, usually available as a header-only single-file library (`catch.hpp`).
   - Place `catch.hpp` in your project directory or a common include directory.
2. **vcpkg Package Manager:**

   - If you are using [vcpkg](https://github.com/microsoft/vcpkg) as a package manager, you can install Catch2 with the following commands:

     ```clone
     git clone https://github.com/microsoft/vcpkg.git
     cd vcpkg
     bootstrap-vcpkg.bat (or bootstrap-vcpkg.sh on Linux/macOS)
     vcpkg integrate install
     vcpkg install catch2
     ```

     The integration step ensures that CMake finds the installed libraries.
3. **CMake ExternalProject:**

   - You can use CMake's `ExternalProject_Add` to download and build Catch2 during your project's build process. Below is an example:

     ```cmake
     include(ExternalProject)

     ExternalProject_Add(
         Catch2
         GIT_REPOSITORY https://github.com/catchorg/Catch2.git
         GIT_TAG v2.x.x  # Replace with the desired version
         PREFIX ${CMAKE_BINARY_DIR}/catch2
         CONFIGURE_COMMAND ""
         BUILD_COMMAND ""
         INSTALL_COMMAND ""
     )

     add_library(Catch2 INTERFACE)
     target_include_directories(Catch2 INTERFACE ${CMAKE_BINARY_DIR}/catch2/src/Catch2/single_include)
     ```

Choose the method that best fits your project's requirements. The manual download is straightforward for smaller projects, while package managers like vcpkg offer centralized management for larger projects. The CMake ExternalProject approach provides flexibility in controlling the Catch2 version and integrating it seamlessly into your build process.

This code is a CMake script that utilizes the `ExternalProject` module to fetch, build, and integrate the Catch2 library into your project. Here's a breakdown of the code:

1. **ExternalProject Module Inclusion:**

   ```cmake
   include(ExternalProject)
   ```

   This line includes the CMake module `ExternalProject` which provides functionality for managing external projects.
2. **ExternalProject_Add:**

   ```cmake
   ExternalProject_Add(
       Catch2
       GIT_REPOSITORY https://github.com/catchorg/Catch2.git
       GIT_TAG v2.x.x  # Replace with the desired version
       PREFIX ${CMAKE_BINARY_DIR}/catch2
       CONFIGURE_COMMAND ""
       BUILD_COMMAND ""
       INSTALL_COMMAND ""
   )
   ```

   - `ExternalProject_Add`: It configures an external project named "Catch2".
   - `GIT_REPOSITORY`: Specifies the Git repository URL for Catch2.
   - `GIT_TAG`: Specifies the Git tag or commit hash for the desired version.
   - `PREFIX`: Sets the installation prefix to `${CMAKE_BINARY_DIR}/catch2`.
   - `CONFIGURE_COMMAND`, `BUILD_COMMAND`, `INSTALL_COMMAND`: These are empty as Catch2 is a header-only library, and no building or installation steps are needed.
3. **add_library and target_include_directories:**

   ```cmake
   add_library(Catch2 INTERFACE)
   target_include_directories(Catch2 INTERFACE ${CMAKE_BINARY_DIR}/catch2/src/Catch2/single_include)
   ```

   - `add_library(Catch2 INTERFACE)`: Creates an INTERFACE library named "Catch2."
   - `target_include_directories`: Specifies the include directories for targets that link to "Catch2." In this case, it includes the single-include directory of Catch2.

This script fetches Catch2 from its Git repository, sets up the necessary paths, and ensures that any target in your project linking against "Catch2" has access to its header files.

1. [Catch2 GitHub CMake Integration](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md)
2. [Catch2 GitHub Releases](https://github.com/catchorg/Catch2/releases)
3. [CMake ExternalProject](https://cmake.org/cmake/help/latest/module/ExternalProject.html)

## The difference between  Catch2::Catch2WithMain  and Catch2::Catch2

In Catch2, `Catch2::Catch2` and `Catch2::Catch2WithMain` are two different targets provided for CMake integration, and their usage depends on whether you need a custom main function or not

1. **Catch2::Catch2:**

   - This target is suitable when you want to provide your own main function for test execution.
   - You need to write your own `main` function, including the necessary initialization for Catch2, such as configuring test options and running tests.

   **Example:**

   ```cpp
   // main.cpp
   #define CATCH_CONFIG_MAIN
   #include "catch.hpp"

   // Your custom main function if needed
   int main(int argc, char* argv[]) {
       // Your custom initialization code
       return Catch::Session().run(argc, argv);
   }
   ```

   ```cmake
   # CMakeLists.txt
   target_link_libraries(MyProject PRIVATE Catch2::Catch2)
   ```

2. **Catch2::Catch2WithMain:**

   - This target includes Catch2's default main function, and you don't need to provide your own.
   - Useful when you want a simpler setup and don't need a custom main function.

   **Example:**

   ```cpp
   // No need for a custom main function
   #include "catch.hpp"

   // Your tests go here
   TEST_CASE("Example Test") {
      REQUIRE(1 + 1 == 2);
   }
   ```

   ```cmake
   # CMakeLists.txt
   target_link_libraries(MyProject PRIVATE Catch2::Catch2WithMain)
   ```

Choose between `Catch2::Catch2` and `Catch2::Catch2WithMain` based on your project's requirements. If you want more control over the test execution process, use `Catch2::Catch2` and provide your own main function. If simplicity and Catch2's default setup are sufficient, use `Catch2::Catch2WithMain`.

Make sure to link the appropriate target in your CMakeLists.txt as demonstrated in the examples above.
