# What is CMake GUI?

CMake GUI is a graphical user interface for CMake, a cross-platform build system generator. It allows users to interactively configure and generate build systems for their projects. With CMake GUI, users can visually set various options and parameters, guiding them through the configuration process [[1]](https://cmake.org/cmake/help/latest/guide/user-interaction/index.html)
[[2]](<https://cmake.org/cmake/help/latest/manual/cmake-gui.1.html>) cmake.org

## How to Configure CMake GUI on Windows PC

To configure CMake GUI on a Windows PC, follow these steps:

1. **Download CMake:**
   - Visit the [official CMake website](https://cmake.org/download/) to download the CMake installer for Windows.
   - Run the installer and follow the installation instructions.
2. **Launch CMake GUI:**
   - After installation, search for "CMake (cmake-gui)" in the Start Menu and open the application.
3. **Select Source Code and Build Directories:**
   - In the CMake GUI window, specify the source code directory (where your project files are) and the build directory (where CMake will generate build files).
4. **Configure:**
   - Click the "Configure" button in the CMake GUI.
   - If the build directory doesn't exist, you might be prompted to create it.
5. **Set Configuration Options:**
   - The CMake GUI will display various configuration options. Modify them according to your project requirements.
   - Click "Configure" again if needed.
6. **Generate Build Files:**
   - Once configuration is successful, click the "Generate" button to generate the build files for your project.
7. **Open Project in IDE:**
   - If you have configured your project to use an Integrated Development Environment (IDE) like Visual Studio, open the generated project file in the IDE.
8. **Build Your Project:**
   - In your chosen IDE, build your project to compile the source code.

### How to Configure CMake GUI on Linux and macOS?

To configure CMake GUI on Linux and macOS, follow these steps:

1. **Install CMake**: Ensure CMake is installed on your system. On Linux, you can use the package manager (`sudo apt-get install cmake` for Debian-based systems or `sudo yum install cmake` for Red Hat-based systems). On macOS, you can use Homebrew (`brew install cmake`).
2. **Open CMake GUI**: Launch CMake GUI from the command line or use the desktop environment's application launcher.
3. **Set Source and Build Directories**: Specify the source code location in the "Where is the source code" field and choose a directory for the build files in the "Where to build the binaries" field.
4. **Configure**: Click the "Configure" button. Select the generator (e.g., "Unix Makefiles" for Linux) and press "Finish."
5. **Adjust Configuration Options**: Review and modify configuration options based on your project requirements. Click "Configure" again after making changes.
6. **Generate**: Click the "Generate" button to create the build files.
7. **Open Project**: Navigate to the build directory and use the generated build files to compile and build your project.

[thatonegamedev.com - How to setup CMake for C++ (Windows)](https://thatonegamedev.com/cpp/how-to-setup-cmake-for-c-windows/)
[CMake documentation](https://cmake.org/cmake/help/latest/manual/cmake-gui.1.html) for detailed information on specific options and functionalities within the CMake GUI.
