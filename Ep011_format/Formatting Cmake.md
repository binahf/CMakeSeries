# How to keep clean codes and CMakeList file during collaboration

When working with others on a software project, it is crucial to maintain consistency and proper formatting in the codebase. This can be accomplished by utilizing code formatting tools like cmake-format and clang-format. Cmake-format is specifically designed to format CMake files in a clear and consistent manner, while clang-format is a versatile tool that can be used to format code in various languages such as C++, Java, and JavaScript in a consistent style. By using these tools, developers can ensure that the code is organized and easy to read, making collaboration more efficient and effective.By utilizing these tools, developers can maintain consistency and readability in the codebase, making it more understandable and easier to work with for other developers. This is particularly crucial in large projects with multiple contributors, as inconsistent formatting can cause confusion and mistakes.

Installation of clang-format and cmake-format clang-format

```sh {"id":"01HPZ2PWCZFMNSKKK4FR6RX6HC"}
# Installing Clang on Windows with  powershell run this Command: 
powershell -Exec ByPass -NoProfile -c "(New-Object Net.WebClient).DownloadString('https://tinyurl.com/llvm-mingw') | IEX"

```

```sh {"id":"01HPXSTKYP8CETGANEN5EP027W"}
# clang-format Linux/Ubuntu
sudo apt-get install clang-format 
```

```sh {"id":"01HPXT5SS1AXJQ0Y36TBGJRW02"}
# To verify or confirm that the installation process has been completed successfully.
/bin$ ls | grep clang
```

```sh {"id":"01HPXTJB3W1D2EHETMRZF7HQ2Z"}
# cmake-format
pip3 install cmake-format
```

Note: you can either pip3 install cmake_format using underbar.

After installation, we should add PATH variable if the prompt says:

Installing collected packages: cmakelang WARNING: The scripts cmake-annotate, cmake-format, cmake-genparsers, cmake-lint and ctest-to are installed in '/home/jbs/.local/bin' which is not on PATH. Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.Installing collected packages: cmakelang WARNING: The scripts cmake-annotate, cmake-format, cmake-genparsers, cmake-lint and ctest-to are installed in '/home/jbs/.local/bin' which is not on PATH. Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.

```sh {"id":"01HPXTW1SWN40FBGVP3J8YTCW3"}
# To handle this, add:
export PATH="~/.local/bin:$PATH" to ~/.bashrc.
```

## VSCode setup

We have to install two extensions: [clang-foramt](https://marketplace.visualstudio.com/items?itemName=xaver.clang-format) and [cmake-format](https://marketplace.visualstudio.com/items?itemName=cheshirekow.cmake-format).

Applying formatters using vscode
I assume that you set vscode to reformat code when saved.

To use the formatters in vscode, you should have .clang-format and .cmake-format.yaml as below:

```sh {"id":"01HPXV9AJ0Z1BAKGVXCG9MC6Q0"}
 .
    ├── .clang-format
    ├── .cmake-format.yaml
    ├── my_package_folder1
    └── my_package_folder2
```

When you create and configure a .cmake-format.yaml file in your project folder (an example can be found [here](https://github.com/NREL/EnergyPlus/blob/develop/.cmake-format.yaml)), the cmake-format extension will automatically format your CMakeLists.txt file whenever you save it.

Once installed, you can use it in your terminal like that to format a file:

```sh {"id":"01HPXKBP4HCKXK06YY68590WEX"}
cmake-format -i myfile.cmake

```

The option `-i` allows `cmake-format` to write the formatted version of the Cmake file in place, which means that, after you run this command, your file is now formatted. Moreover, you can create your how configuration file, that you can name `.cmake-format.json` for example, if you want, to specify how you want some elements to render in your Cmake files in a folder.

### How to automatically format a repository ?

```sh {"id":"01HPXKBP4HCKXK06YY68SF4JJM"}
# Only on Linux
find . \( -name '*.cmake' -o -name 'CMakeLists.txt' \) -exec cmake-format -i {} \;

```

This command will look through all the folder and sub-folder from your current position, and look for the files with the extension ".cmake" or for the `CMakeLists.txt` files. Then it will place all those files in place of the `{}` and run the command `cmake-format -i` with all the files.

If you can't remember the command to format all the Cmake files you can create a [Makefile](https://gl.developpez.com/tutoriel/outil/makefile/), on the top level of your project repository, so that you will have an alias for this complicated line. This `Makefile` will be as simple as that:

```sh {"id":"01HPXKBP4HCKXK06YY68VDZDTJ"}
format:
    set -f
    find . \( -name '*.cmake' -o -name 'CMakeLists.txt' \) -exec cmake-format -i {} \;
    set +f

```

And now, you just have to run `make format`, and all the formatting will occur without them having to learn a complicated line. This is actually more powerful than that ! If for some reason, you have to change the tool you use for formatting Cmake files, all you have to do, is to modify the `Makefile`, and your coworkers won’t even be bother by it, since the command `make format` will still be the thing they will have to do !Moreover, if you want, you can also add other formatting tools for other language in the `Makefile` so that the command `make format` formats actually all your source files, whatever their languages !!! there is a [Visual Studio Code extension](https://marketplace.visualstudio.com/items?itemName=cheshirekow.cmake-format) for cmake-forma, and a [Sublime Text extension](https://packagecontrol.io/packages/CMakeFormat) for cmake-format. This can help you, but if one of your collaborator doesn’t use those text editor, they won’t be able to enjoy those extension.

## Let’s force formatting by default

Pre-commit hooks for cmake-format are scripts or configurations that are set up to automatically run the cmake-format tool before a commit is made to a code repository. This ensures that the formatting of CMake files is consistent and adheres to a specific style guide, helping to maintain code quality and readability in a project.

A pre-commit ready to use given by the author of the `cmake-format` repository can be find  [here](https://github.com/cheshirekow/cmake-format-precommit)

### Pre-commit hook

If you are using `git` (and I hope you do version your code), you can create what is called a [pre-commit hook](https://githooks.com/). This is a script that is going to be executed before each of your commits, which is perfect for formatting !

### CI check

Another way to force the formatting of the files on your repository, is to create a check on a CI/CD system such as [Travis](https://travis-ci.org/). If you are not familiar with the concept of [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration), I encourage you to look at it, it will truly benefit you, and your team. For those who know what a CI/CD system such as Travis is, let’s continue.

To test that the files of our repository are well formatted all we have to do is to implement this three steps:

* Getting `cmake-format` on the system
* Running the format command `make format`
* Checking that the formatting didn’t change any files
* To check if one file as change after the formatting, which will mean that the person did not have formatted his code before the commit or the push on the CI.And there is a command line for that too

```sh {"id":"01HPXKBP4HCKXK06YY6APXAZS4"}
git diff --exit-code

```

This command will check the difference for the files in your repository, and will return 0 (= success) if no change is detected, and something else (=failure) if a file has change.

#### [GitHub Action](https://github.com/features/actions)

To help a bit more, you will fin below this line, the content of a [GitHub Action](https://github.com/features/actions) which does exactly that ! Since GitHub Actions is now available, I think that it might be easier for anyone to integrate it that way.

```yaml {"id":"01HPXKBP4HCKXK06YY6D69XF40"}
name: C/C++ CI

on: [push]

jobs:
  build:

    runs-on: windows-2016

    steps:
    - uses: actions/checkout@v1
    - name: Installing dependency
      run: |
        python -m pip install --upgrade pip
        pip install cmake_format
    - name: Running cmake formatting
      run: make format
    - name: Checking formatting
      run: git diff --exit-code

```

### Clang format

clang-format is just works out-of-box when .clang-format is located in your project root folder.

Get .clang-format here [example.1](https://github.com/icsl-Jeon/simple-cmake-package) [example.2](https://github.com/kehanXue/google-style-clang-format/blob/master/.clang-format)

```yaml {"id":"01HPZ0VMM2DJV8YC3MD86A4S6T"}
# check Clang and clang format version
clang --version
clang-format --version
```

```yaml {"id":"01HPZDDF8KK2EKH2MPT2P9J5JW"}
clang-format --style="google" filenma.cpp
```

```yaml {"id":"01HPZ15Z20BJKGD1PA0E50X805"}

clang-format -i --style="google" filenma.cpp 
```

```yaml {"id":"01HPZBVK0HSMC91KYRP017Y08D"}
clang-format -i --style="LLVM" filenma.cpp
```

```yaml {"id":"01HPZCXQ38D1YYYK0PCQ19FFYZ"}
clang-format -i --style=file filenma.cpp 
```

```yaml {"id":"01HPZWC88155YGMHJE4ZH532GZ"}
cmake --build build -t format-code # used format-code is set in our CMakeLists.txt file 
```

```yaml {"id":"01HQ0DHAXP2FK5Q7HKSDCB3YAB"}
cmake -GNinja -S . -B build -DCMAKE_CXX_COMPIER=clang++
```

<https://dev.to/10xlearner/formatting-cmake-4dle>
