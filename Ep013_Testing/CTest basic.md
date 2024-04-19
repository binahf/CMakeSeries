# how does *Ctest* work in cmake

`CTest` is a testing tool that comes with CMake, designed to work with CMake projects seamlessly. It allows you to define and run tests, providing a straightforward way to ensure the correctness of your code. Below is a step-by-step explanation with real-world scenarios and sample code in C/C++:

## Step 1: Set Up CTest in CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.15)
project(MyProject)

# Add your project's source files
add_executable(MyProject main.cpp)

# ...

# Enable testing
enable_testing()

# Add tests using CTest
add_test(NAME MyTest COMMAND MyProjectTest)
```

### Step 2: Write Test Code

```cpp
// test.cpp
#include <iostream>

int main() {
    // Your test logic here
    std::cout << "Running tests..." << std::endl;
    // Example: Assert that 1 + 1 equals 2
    if (1 + 1 == 2) {
        std::cout << "Test Passed!" << std::endl;
        return 0;
    } else {
        std::cerr << "Test Failed!" << std::endl;
        return 1;
    }
}
```

### Step 3: Run Tests

In your project directory:

```bash
mkdir build
cd build
cmake ..
cmake --build .
ctest
```

### Explanation

1. **Set Up CTest in CMakeLists.txt:**

   - Add `enable_testing()` to enable testing.
   - Use `add_test()` to define tests. `NAME` specifies the test name, and `COMMAND` specifies the test executable.
2. **Write Test Code (test.cpp):**

   - Create a test file (e.g., `test.cpp`) containing your test logic.
   - In this example, we're using a simple arithmetic test.
3. **Run Tests:**

   - Create a build directory, configure, and build your project with CMake.
   - Use `ctest` to run tests. It discovers and executes tests defined in the CMakeLists.txt.

### Real-world Scenario

Let's say you have a function in your C++ code that performs a mathematical operation, and you want to ensure its correctness. You can write tests using CTest to verify that the function behaves as expected in different scenarios.

### Test Code (test.cpp) for a Math Function

```cpp
// test.cpp
#include <iostream>
#include "math_functions.h"  // Include your header file

int main() {
    // Test Case 1: Addition
    if (add(2, 3) == 5) {
        std::cout << "Addition Test Passed!" << std::endl;
    } else {
        std::cerr << "Addition Test Failed!" << std::endl;
        return 1;
    }

    // Test Case 2: Subtraction
    if (subtract(5, 2) == 3) {
        std::cout << "Subtraction Test Passed!" << std::endl;
    } else {
        std::cerr << "Subtraction Test Failed!" << std::endl;
        return 1;
    }

    // Add more test cases as needed

    std::cout << "All Tests Passed!" << std::endl;
    return 0;
}
```

This real-world scenario tests the `add` and `subtract` functions from a hypothetical `math_functions.h` header file. The `CTest` setup in CMakeLists.txt allows you to run these tests easily.
