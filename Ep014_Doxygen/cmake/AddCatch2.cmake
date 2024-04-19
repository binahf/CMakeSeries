


Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.5.2
)


FetchContent_MakeAvailable(Catch2)


  # CMake projects should use: "-DCMAKE_TOOLCHAIN_FILE=C:/Dev/vcpkg/scripts/buildsystems/vcpkg.cmake"
  # "-DCMAKE_TOOLCHAIN_FILE=C:/Dev/vcpkg/scripts/buildsystems/vcpkg.cmake"
# vcpkgintegrate install


# include(ExternalProject)

# ExternalProject_Add(
#     Catch2
#     GIT_REPOSITORY https://github.com/catchorg/Catch2.git
#     GIT_TAG v3.5.2 # Replace with the desired version
#     PREFIX ${CMAKE_BINARY_DIR}/catch2
#     CONFIGURE_COMMAND ""
#     BUILD_COMMAND ""
#     INSTALL_COMMAND ""
# )

# add_library(Catch2 INTERFACE)
# target_include_directories(Catch2 INTERFACE ${CMAKE_BINARY_DIR}/catch2/src/Catch2/single_include)
