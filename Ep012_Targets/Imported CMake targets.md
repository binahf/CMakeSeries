# Imported CMake targets

Imported CMake targets" refers to CMake targets that are defined in an external project and imported into the current CMake project. These targets can be used in the current project's build system to specify dependencies, include libraries, or perform other build-related tasks. By importing CMake targets, developers can easily reuse code and libraries across multiple projects.

The two main approaches for handling dependencies in CMake. The first approach involves linking a dependency as a CMake project, which simplifies the process of using it but requires building it yourself. The second approach involves linking directly against prebuilt binaries if the dependency does not have a well-implemented FindPackage/Library helper. However, this method can make the CMake code messier and more complex.

```sh
# dependencies.cmake
set ( DGM_FSM_VERSION "1.2.0" )
set ( DGM_FSM_URL "https://github.com/nerudaj/dgm-fsm-lib/releases/download/v${DGM_FSM_VERSION}/dgm-fsm-lib-${DGM_FSM_VERSION}-windows-vc17-x64.zip" )

include ( FetchContent )

FetchContent_Declare ( DGM_FSM
  URL "${DGM_FSM_URL}"
  DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)

FetchContent_MakeAvailable ( DGM_FSM )
FetchContent_GetProperties ( DGM_FSM SOURCE_DIR DGM_FSM_FOLDER )

add_library ( Dep_fsm IMPORTED STATIC )

set_property(
  TARGET Dep_fsm
  APPEND PROPERTY
  # Restricts configurations to just Debug and Release,
  # removing MinSizeRel and RelWithDebInfo
  IMPORTED_CONFIGURATIONS DEBUG RELEASE
)

set_target_properties ( Dep_fsm PROPERTIES
  IMPORTED_LOCATION_DEBUG "${DGM_FSM_FOLDER}/lib/libfsm-d.lib"
  IMPORTED_LOCATION_RELEASE "${DGM_FSM_FOLDER}/lib/libfsm.lib"
  INTERFACE_INCLUDE_DIRECTORIES "${DGM_FSM_FOLDER}/include"
)
```

To help reduce some of the difficulties, you can utilize prebuilt IMPORTED libraries. These libraries enable you to easily create linkable targets for prebuilt binaries, which can be used with a single call. Imported libraries do not compile anything themselves, but can be used like regular targets - as link libraries, include directories, or by setting properties to them.

```sh
# CMakeLists.txt
cmake_minimum_required ( VERSION 3.26 )

include ( dependencies.cmake )

project ( DEMO )

add_executable ( ${PROJECT_NAME}
  "${CMAKE_CURRENT_SOURCE_DIR}/src/Main.cpp"
)

# If this target was a library, anybody linking against
# it would automatically link Dep_fsm as well
target_link_libraries ( ${PROJECT_NAME}
  PUBLIC Dep_fsm
)
```

Dependency management in CMake refers to the process of specifying and managing the dependencies of a CMake project. This involves declaring the libraries, headers, and other external resources that are required for the project to build and run successfully. CMake provides features and commands to help manage these dependencies, such as `target_link_libraries` to link libraries to a target, `find_package` to locate and include external packages, and `include_directories` to specify additional include directories. By effectively managing dependencies in CMake, developers can ensure that their projects are properly built and can easily integrate with external libraries and resources.

Dependency management in CMake,[part 1](https://medium.com/@nerudaj/dependency-management-in-cmake-part-1-421c6b36417e)

Dependency management in CMake,[part 2](https://medium.com/@nerudaj/dependency-management-in-cmake-part-2-478f63794eb5)

In the context of creating and using dynamic libraries, CMake can be used to define the build process for creating dynamic libraries (shared libraries) in a project, as well as specifying how those libraries should be linked and used by other parts of the project. This allows developers to easily create and incorporate dynamic libraries into their projects, making their code more modular and reusable.

CMake to Create and Use Dynamic Libraries [clic here](https://batuhankoc.medium.com/use-cmake-to-create-and-use-dynamic-libraries-5f6498417b3c)
