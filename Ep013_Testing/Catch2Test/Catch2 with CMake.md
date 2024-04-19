# Let's break down the step-by-step process for writing and executing tests using Catch2, a modern C++ test framework, in a CMake project, covering Unit Tests, Test-Driven Development (TDD), and Behavior-Driven Development (BDD). We'll also include a real-world scenario

## Step 1: Setup Catch2 with CMake

1. **Include Catch2 in Your Project:**

   - Add Catch2 as a dependency in your CMake project.
   - Example (CMakeLists.txt):

   ```cmake
   # Add Catch2 as a dependency
   include(FetchContent)
   FetchContent_Declare(
   catch2
   URL https://github.com/catchorg/Catch2/archive/v2.x.zip
   )
   FetchContent_MakeAvailable(catch2)

   ```

2. **Configure Your Project:**

- Configure your CMake project to use Catch2.
- Example (CMakeLists.txt):

```cmake
# Configure your project to use Catch2
add_executable(your_project_test your_test_files.cpp)
target_link_libraries(your_project_test Catch2::Catch2)
```

### Step 2: Writing Tests with Catch2

1. **Write Test Cases:**

   - Use the `TEST_CASE` macro to define test cases.
   - Encompass various scenarios and functions in your C++ code.
   - Example (test_file.cpp):

   ```cpp
   #include <catch.hpp>

   TEST_CASE("Addition") {
   // Test logic and assertions using Catch2 macros
   REQUIRE(add(2, 3) == 5);
   }

2. **Test-Driven Development (TDD):**

   - Follow TDD principles by writing tests before writing the actual code.
   - Example:
   - Write a failing test for a new feature or fix.
   - Implement the minimum code required to pass the test.
   - Refactor and iterate.

### Step 3: Behavior-Driven Development (BDD)

1. **Behavior-Driven Development (BDD) with Tags:**

   - Use tags to indicate BDD-style features and scenarios.
   - Example (test_file.cpp):

   ```cpp
   #include <catch.hpp>

   SCENARIO("Calculator functionality") {
   GIVEN("A Calculator instance") {
   WHEN("Adding two numbers") {
   THEN("The result should be correct") {
       REQUIRE(add(2, 3) == 5);
   }
   }
   // More scenarios...
   }
   }
   ```

### Step 4: Integration and Execution

1. **Link Catch2 Library with Test Executable:**

   - Link Catch2 library with your test executable.
   - Example (CMakeLists.txt):

   ```cmake
   target_link_libraries(your_project_test Catch2::Catch2)

2. **Run Tests Using CTest:**

   - Use CTest, the testing tool that comes with CMake.
   - Discover and execute your tests.
   - Example:

```bash
# Run tests using CTest
ctest
```

### Real-world Scenario

Consider a scenario where you have a class `Calculator` with various arithmetic operations. You want to write tests using Catch2 to ensure the correctness of these operations and follow TDD principles.

```cpp
// Calculator.h
class Calculator {
public:
int add(int a, int b);
// Other operations...
};

// Calculator.cpp
int Calculator::add(int a, int b) {
return a + b;
}
```

In your Catch2 test file:

```cpp
// CalculatorTest.cpp
#include <catch.hpp>
#include "Calculator.h"

TEST_CASE("Calculator Addition") {
Calculator calculator;

SECTION("Adding positive numbers") {
REQUIRE(calculator.add(2, 3) == 5);
}

SECTION("Adding negative numbers") {
REQUIRE(calculator.add(-2, -3) == -5);
}
}
```

This real-world scenario demonstrates how to use Catch2 in a CMake project, covering setup, writing tests, and incorporating TDD and BDD principles for unit testing.

Catch2 is a modern, feature-rich C++ testing framework visit the Github repo here [catch2](https://github.com/catchorg/Catch2)
