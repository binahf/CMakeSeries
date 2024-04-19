---
runme:
  id: 01HQB37DNG7VV8B4TK71W0N701
  version: v3
---

# Doxygen, What is it? How it works?

Doxygen is an open-source tool for Windows, Linux, and MacOS, it is used widely as a documentation generation tool to simplify the process of creating and maintaining documentation for software projects. It is trendy in programming, where it helps developers generate clear and comprehensive documentation for their codebases.Standard tool for generating documentation from annotated C++ sources, but it also supports other popular programming languages such as C, Objective-C, C#, PHP, Java, Python, IDL (Corba, Microsoft, and UNO/OpenOffice flavors), Fortran, VHDL and to some extent D

## Doxygen with C/C++ documentation in a CMake

When integrated with CMake, it can streamline the process of generating documentation for C and C++ projects. This guide provides step-by-step instructions on how to use Doxygen with C/C++ documentation in a CMake project, including installation on Windows and Linux systems.

### Prerequisites

- Basic understanding of C/C++ programming
- Familiarity with CMake build system

## Installing Doxygen

### Windows

1. Download the latest version of [Doxygen](https://doxygen.nl/download.html) from the official website or use a package manager like Chocolatey.
2. Run the installer and follow the on-screen instructions.
3. Add the installation directory to the system PATH. Doxygen comes with a graphical user interface, however, those who want to use it from the command terminal, need to add its executable to their system’s path and we need that for Cmake project
4. To access the GUI fronted of Doxygen, go to your Windows search box or click on the Start button and type – DoxyWizard. As its icon appears, click to run the same. wizard.  Open your PowerShell or Command prompt and then type the given command to check the version of the install DoXygen on your system.

### Linux

Install Doxygen using your distribution's package manager. For example, on Ubuntu:

```sh {"id":"01HQB37DNF9EA1P22TAWRVND04"}
sudo apt-get update
sudo apt-get install doxygen

```

## Integrating Doxygen with CMake

1. Ensure that Doxygen is installed on your system (follow the installation steps above).

```sh {"id":"01HQB37DNF9EA1P22TAZPS087C"}
doxygen--version
doxygen--help

```

2. Create a `Doxyfile` configuration file in your project directory, adjust the configuration settings according to your project's requirements.
   Doxygen uses a configuration file to determine all of its settings. Each project should get its own configuration file. A project can consist of a single source file, but can also be an entire source tree that is recursively scanned.
   To simplify the creation of a configuration file, doxygen can create a template configuration file for you. To do this call doxygen from the command line with the -g option:

```sh {"id":"01HQB4R8ABM8CM0SN9TWYESZTE"}
doxygen -g <config-file>
```

where  is the name of the configuration file. If you omit the file name, a file named Doxyfile will be created. If a file with the name  already exists, doxygen will rename it to .bak before generating the configuration template. If you use - (i.e. the minus sign) as the file name then doxygen will try to read the configuration file from standard input (stdin), which can be useful for scripting.

```cmake {"id":"01HQB37DNF9EA1P22TB0KFX0BN"}
# Example Doxyfile configuration
DOXYFILE_ENCODING      = UTF-8
PROJECT_NAME           = "MyProject"
OUTPUT_DIRECTORY       = docs
INPUT                  = src
RECURSIVE              = YES

```

After the configuration of Doxyfile cd to docs dorectory and run the command doxygen to genarate the doc file

```cmake {"id":"01HQBHSVWAC2M8MBFG3ENF46T7"}
Doxygen
```

3. Add a custom target to your `CMakeLists.txt` to generate documentation:

```cmake {"id":"01HQB37DNG7VV8B4TK6WWVE2BQ"}
# Add custom target to generate documentation
find_package(Doxygen)
if(DOXYGEN_FOUND)
add_custom_target(
docs
COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile
WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
COMMENT "Generating API documentation with Doxygen"
VERBATIM
)
endif()

```

4. Build the documentation using CMake:

```bash {"id":"01HQB37DNG7VV8B4TK6XVTGZTW"}
cmake --build . --target docs

```

Open the generated documentation in the `docs` directory.

## Example Usage

Consider a simple C++ project with the following directory structure:

```sh {"id":"01HQB37DNG7VV8B4TK6YKCPB90"}
project/
├── CMakeLists.txt
├── src/
│   ├── main.cpp
│   └── library.h
└── Doxyfile

```

Here's how you can annotate your code for documentation:

```cpp {"id":"01HQB37DNG7VV8B4TK6ZJRG0HY"}
// library.h
/// \file library.h
/// \brief This is a sample library header.
///
/// This library provides basic arithmetic operations.

#ifndef LIBRARY_H
#define LIBRARY_H

/// \brief Adds two integers.
/// \param a The first integer.
/// \param b The second integer.
/// \return The sum of a and b.
int add(int a, int b);

#endif // LIBRARY_H

```

## Conclusion

By following these steps, you can seamlessly integrate Doxygen with your C/C++ project using CMake, enabling easy generation of comprehensive documentation for your codebase.

## 🌐 Sources

1. [Doxygen Documentation](https://www.doxygen.nl/manual/index.html)
2. [Doxygen GitHub Repository](https://github.com/doxygen/doxygen)
3. [CMake Doxygen Example](https://vicrucann.github.io/tutorials/quick-cmake-doxygen/)
4. [Documentation](https://embeddedinventor.com/guide-to-configure-doxygen-to-document-c-source-code-for-beginners/) Using Doxygen To Document C Source Code
