---
runme:
  id: 01HQC9J29KP0XQJ42GG6KA4JE3
  version: v3
---

Package managers like `vcpkg` simplify the process of managing external dependencies in C++ projects. When integrated with CMake, `vcpkg` automates the retrieval, build, and linking of third-party libraries, streamlining the development workflow. Here's a step-by-step explanation with code in a real-world scenario

## Step 1: Install `vcpkg`

```bash {"id":"01HQC9J29KP0XQJ42GFYH1B0NE"}
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat (Windows) or ./bootstrap-vcpkg.sh (Unix)

```

### Step 2: Integrate `vcpkg` with CMake

In your CMakeLists.txt file:

```cmake {"id":"01HQC9J29KP0XQJ42GFZMX6G6P"}
cmake_minimum_required(VERSION 3.15)
project(MyProject)

# Set the vcpkg toolchain file
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg toolchain file")

# Add your project's source files
add_executable(MyProject main.cpp)

# Link against the required packages from vcpkg
find_package(fmt CONFIG REQUIRED)
target_link_libraries(MyProject PRIVATE fmt::fmt)

```

### Step 3: Integrate with `vcpkg` in Visual Studio

If using Visual Studio, open a Developer Command Prompt and navigate to your project:

```bash {"id":"01HQC9J29KP0XQJ42GG04N68TP"}
cd MyProject
vcpkg integrate install

```

### Step 4: Install Packages

```bash {"id":"01HQC9J29KP0XQJ42GG3HDMEQ6"}
vcpkg install fmt

```

### Step 5: Write Code Using the Installed Package

```cpp {"id":"01HQC9J29KP0XQJ42GG3R6PSA9"}
#include <iostream>
#include <fmt/core.h>

int main() {
    std::cout << fmt::format("Hello, {}!", "World") << std::endl;
    return 0;
}

```

### Explanation

1. **Install `vcpkg`:** Clone the `vcpkg` repository and bootstrap it.
2. __Integrate with CMake:__ Set the `CMAKE_TOOLCHAIN_FILE` to `vcpkg.cmake` in your CMakeLists.txt to enable CMake to use `vcpkg`.
3. **Integrate with Visual Studio:** If using Visual Studio, run `vcpkg integrate install` in your project directory to integrate with Visual Studio.
4. **Install Packages:** Use `vcpkg install` to install the required packages. In this example, we installed the `fmt` library.
5. **Write Code:** Incorporate the installed package into your C++ code. In this case, we used the `fmt` library for string formatting.

By following these steps, `vcpkg` seamlessly manages dependencies, and CMake integrates them into your project, making it easy to handle external libraries.

## Quick start guide for either Windows

First, download and bootstrap vcpkg itself; it can be installed anywhere, but generally we recommend using vcpkg as a submodule so the consuming repo can stay self-contained. Alternatively, vcpkg can be installed globally; we recommend somewhere like C:\src\vcpkg or C:\dev\vcpkg, since otherwise you may run into path issues for some port build systems.

```cpp {"id":"01HQC9ZBEFA9DTQ5GGMD6T6XY6"}
git clone https://github.com/microsoft/vcpkg
bootstrap-vcpkg.bat                     //To install the libraries for your project, run:
vcpkg install [packages to install]    //Note: This will install x86 libraries by default. To install x64, run: 
vcpkg install [package name]:x64-windows or 
vcpkg install [packages to install] --triplet=x64-windows
vcpkg search [search term]
vcpkg integrate install
```

After this, you can now create a New non-CMake Project (or open an existing one). All installed libraries are immediately ready to be #include'd and used in your project without additional configuration.
In order to use vcpkg with CMake outside of an IDE, you can use the toolchain file:

```cpp {"id":"01HQCAPAGZV6VG0TG4RVBYKFE3"}
cmake -B [build directory] -S . "-DCMAKE_TOOLCHAIN_FILE=[path to vcpkg]/scripts/buildsystems/vcpkg.cmake"
cmake --build [build directory]
```

With CMake, you will still need to find_package and the like to use the libraries

my installation location is C:/Dev/vcpkg
CMake projects should use: "-DCMAKE_TOOLCHAIN_FILE=C:/Dev/vcpkg/scripts/buildsystems/vcpkg.cmake"
 "-DCMAKE_TOOLCHAIN_FILE=C:/Dev/vcpkg/scripts/buildsystems/vcpkg.cmake"

Vcpkg as a Submodule with CMake
When using vcpkg as a submodule of your project, you can add the following to your CMakeLists.txt before the first project() call, instead of passing CMAKE_TOOLCHAIN_FILE to the cmake invocation.

```cpp {"id":"01HQCB23Q9SF25CFMNZMMJ5PZA"}
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
  CACHE STRING "Vcpkg toolchain file")
```

This will still allow people to not use vcpkg, by passing the CMAKE_TOOLCHAIN_FILE directly, but it will make the configure-build step slightly easier.

### Tab-Completion/Auto-Completion

vcpkg supports auto-completion of commands, package names, and options in both powershell and bash. To enable tab-completion in the shell of your choice, run:

```cpp {"id":"01HQCBA4JFEMNR8V8F26EYFCVV"}
vcpkg integrate powershell
vcpkg integrate bash # or zsh
```

[vcpkg](https://github.com/microsoft/vcpkg/?tab=readme-ov-file#quick-start-windows)

[vcpkg-artifacts](https://github.com/microsoft/vcpkg-tool)

## Configure the VCPKG_ROOT environment variable.

```cpp {"id":"01HQCC30715D0PEPNW5VAMKQYS"}
set VCPKG_ROOT="C:\path\to\vcpkg"     // command promt cmd
set PATH=%VCPKG_ROOT%;%PATH%
```

```cpp {"id":"01HQCC3WZ9B9568G40NSF8YS33"}
$env:VCPKG_ROOT = "C:\path\to\vcpkg"        // powrshell
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"
```

```cpp {"id":"01HQCCQCTGDY6QB9YQTRH80VPY"}
export VCPKG_ROOT=/path/to/vcpkg       // bash
export PATH=$VCPKG_ROOT:$PATH
```

To allow the CMake project system to recognize C++ libraries provided by vcpkg, you'll need to provide the vcpkg.cmake toolchain file. To automate this, create a CMakePresets.json file in the "helloworld" directory with the following content:

```cpp {"id":"01HQCCDDW9M8D8R7DR9A88A1EH"}
{
    "version": 3,
    "configurePresets": [
        {
            "name": "default",
            "binaryDir": "${sourceDir}/build",
            "cacheVariables": {
                "CMAKE_TOOLCHAIN_FILE": "$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
            }
        }
    ]
}
```

This CMakePresets.json file contains a single "default" preset for CMake and sets the CMAKE_TOOLCHAIN_FILE variable. The CMAKE_TOOLCHAIN_FILE allows the CMake project system to recognize C++ libraries provided by vcpkg. Adding the CMakePresets.json automates the process of specifying the toolchain when running CMake.
