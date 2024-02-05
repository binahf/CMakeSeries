---
runme:
  id: 01HNVE59ZXGFS8R5MWH5MX2QGC
  version: v2.2
---

# How to Link Header File "stats.h" from Another Folder to "main.c"

To link a header file from another folder to your main C file, you can use the `#include` directive along with the relative path or by specifying the path in your project settings. Here are two approaches:

1. **Using Relative Path in `#include` Directive:**
   You can include the header file in your main.c using a relative path. Assuming "stats.h" is in a folder named "include," and your main.c is in the project root, you can do:

   ```c
   #include "include/stats.h"
   ```

   This informs the compiler to look for "stats.h" in the "include" folder relative to the location of your main.c file.

2. **Configuring Project Settings:**
   Another approach is to set the path in your project settings:

   - Right-click on the project.
   - Select Properties.
   - Navigate to Configuration Properties -> C/C++ -> General.
   - Set the path under Additional Include Directories.

   This method allows you to specify the folder where the compiler should look for header files.

## 🌐 Sources
1. [Stack Overflow - Including a header file from another directory](https://stackoverflow.com/questions/7581408/including-a-header-file-from-another-directory)
2. [CopyProgramming - Linux: Importing C Header Files from Different Directories](https://copyprogramming.com/howto/c-c-include-file-from-another-directory)
3. [Reddit - How to include header files in a *.c file which is an...](https://www.reddit.com/r/gnu/comments/w2sh14/how_to_include_header_files_in_a_c_file_which_is/)
4. [Physics Forums - How to include two header files that are contained in...](https://www.physicsforums.com/threads/how-to-include-two-header-files-that-are-contained-in-the-same-folder.1017107/)
5. [CopyProgramming - Adding a Header File in C: A Guide](https://copyprogramming.com/howto/how-to-add-a-header-file-in-c)
6. [ITecNote - C++ – how to include header files in other src folder](https://itecnote.com/tecnote/c-how-to-include-header-files-in-other-src-folder/)