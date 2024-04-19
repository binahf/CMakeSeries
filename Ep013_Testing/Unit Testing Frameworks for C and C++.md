# Unit Testing Frameworks for C and C++

Here is a curated list of unit testing frameworks that work for both C and C++, organized from modern to widely used. Each framework is accompanied by a brief description, example code snippets, and information about compatibility with CMake.

## Catch2: Modern C++ Test Framework for Unit Tests, TDD, and BDD with CMake

Catch2 is a modern, C++-native test framework designed for unit tests, Test-Driven Development (TDD), and Behavior-Driven Development (BDD). It works seamlessly for both C and C++ projects using CMake. Here's a brief overview of how Catch2 integrates with C/C++ and CMake:

**1. Integration with CMake:**

- Include Catch2 in your CMake project either by downloading the Catch2 header and source files or using package managers like `vcpkg`.
- Add Catch2 to your CMakeLists.txt file, specifying include directories and linking libraries.

```cmake
# CMakeLists.txt
find_package(Catch2 REQUIRED)
add_executable(tests test_main.cpp your_test_files.cpp)
target_link_libraries(tests Catch2::Catch2)
```

**2. Writing Tests:**

- Define test cases using the `TEST_CASE` macro provided by Catch2.
- Use various assertion macros (`REQUIRE`, `CHECK`, `REQUIRE_THAT`, etc.) to express test conditions within your test cases.

```cpp
// Example test file
#include "catch.hpp"

TEST_CASE("Example Test Case", "[tag]") {
REQUIRE(1 + 1 == 2);
CHECK("Hello" != "World");
}
```

**3. Test Execution:**

- Build your project using CMake, and it will generate an executable for your tests.
- Run the generated executable to execute all the defined test cases.

**4. BDD-style Testing:**

- Catch2 supports BDD-style testing with natural language constructs for specifying behavior.
- Use `SCENARIO`, `GIVEN`, `WHEN`, and `THEN` to structure your BDD-style tests.

```cpp
SCENARIO("Calculator adds numbers", "[calculator]") {
GIVEN("a calculator") {
Calculator calc;

WHEN("adding two numbers") {
auto result = calc.add(2, 3);

THEN("the result should be correct") {
REQUIRE(result == 5);
}
}
}
}
```

- **CMake Compatibility:** Compatible with CMake.
- **Source:** [Catch2 GitHub Repository](https://github.com/catchorg/Catch2)
- [CppCon 2018: Phil Nash “Modern C++ Testing with Catch2”](https://www.youtube.com/watch?v=Ob5_XZrFQH0)

## Comprehensive Guide: Integrating Google Test (gtest) and Google Mock (gmock) with CMake in a C/C++ Project

Google Test (gtest) and Google Mock (gmock) are robust testing frameworks for C/C++. This guide provides step-by-step instructions on seamlessly integrating them with CMake for effective unit testing and object mocking.

- Download the Google Test and Google Mock source files or use a package manager like `vcpkg` for easy setup.
- Include the frameworks in your project, either by placing them in a designated folder or specifying the package manager in your CMake configuration.

## Google Test (gtest) Overview

### 1. Installation

Include Google Test in your CMake project. You can use an external project, submodule, or package management systems. For example, using a submodule in your project:

```cmake
# CMakeLists.txt

# Add Google Test as a submodule
add_subdirectory(googletest)

# Include Google Test headers
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
```

### 2. Test Cases

- Write test cases using the `TEST` macro provided by gtest. Example test case:

```cpp
// MyTests.cpp

#include <gtest/gtest.h>

TEST(MyTestSuite, MyTestCase) {
// Test logic using gtest assertions
EXPECT_EQ(2 + 2, 4);
}
```

### 3. Fixture Support

- Utilize fixtures for shared setup and teardown logic. Example fixture:

```cpp
// MyFixtureTests.cpp

#include <gtest/gtest.h>

class MyFixture : public ::testing::Test {
protected:
void SetUp() override {
// Common setup logic
}

void TearDown() override {
// Common teardown logic
}
};

TEST_F(MyFixture, MyTestWithFixture) {
// Test logic using gtest assertions and fixture resources
EXPECT_TRUE(true);
}
```

### 4. Execution

- Build the test executable using CMake. Running the built executable executes all defined test cases. CMakeLists.txt example:

```cmake
# CMakeLists.txt

# Define the test executable
add_executable(MyTests MyTests.cpp MyFixtureTests.cpp)

# Link with Google Test
target_link_libraries(MyTests gtest gtest_main)
```

## Google Mock (gmock) for Object Mocking

### 1. Include Google Mock

Google Mock is a framework for writing and using C++ mock classes. It can be used to create and inject mock dependencies into your code.

- Include Google Mock in your CMake project alongside Google Test. Example in CMakeLists.txt:

```cmake
# CMakeLists.txt

# Add Google Mock as a submodule
add_subdirectory(googlemock)

# Include Google Mock headers
include_directories(${gmock_SOURCE_DIR}/include ${gmock_SOURCE_DIR})
```

### 2. Mocking Objects

- Create mock objects by defining mock classes using the `MOCK_METHOD` macro. Example mock class:

```cpp
// MyMock.h

#include <gmock/gmock.h>

class MyMock {
public:
MOCK_METHOD(int, myFunction, (int, int));
};
```

### 3. Expectations

- Set expectations on how mock objects should be called during the test. Example usage in a test case:

```cpp
// MyMockTests.cpp

#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "MyMock.h"

TEST(MyMockTest, MockedFunctionCalled) {
MyMock mock;
EXPECT_CALL(mock, myFunction(1, 2)).Times(1);

// Code under test calling myFunction(1, 2)
// ...

// gmock verifies the expectation
}
```

### 4. Integration with Google Test

Google Mock seamlessly integrates with Google Test. Mocked objects can be used within test cases to validate interactions and behaviors.

## CMake Integration

### 1. CMakeLists.txt Configuration

Configure CMakeLists.txt to include Google Test and Google Mock. Example:

```cmake
# CMakeLists.txt

# Define the test executable with mock tests
add_executable(MyMockTests MyMockTests.cpp)

# Link with Google Test and Google Mock
target_link_libraries(MyMockTests gtest gtest_main gmock)
```

### 2. Test Execution

Use CTest, the testing tool that comes with CMake, to discover and execute your tests. Ensure a straightforward and automated testing process:

```bash
cmake --build .
ctest
```

```**Build
- Build your project using CMake to generate the executable for the tests.
- Execute the generated test executable to run your Google Test and Google Mock tests.
```

```**Review
- Google Test will provide detailed output, highlighting which tests passed or failed, along with any assertion failures.
```

- **CMake Compatibility:** Compatible with CMake.
- For a more in-depth guide, refer to the provided sources.
- [Google Test GitHub Repository](https://github.com/google/googletest)
- [GoogleTest User’s Guide](https://google.github.io/googletest/)

1. [Google Mock for C++ testing - Oscar Forner](https://oscarforner.com/blog/2016-01-22-google-mock-for-cpp-testing/)
2. [googlemock/README.md](https://chromium.googlesource.com/external/github.com/google/googletest/+/refs/heads/v1.8.x/googlemock/README.md)
3. [Introduction to Google Test and Google Mock - YouTube](https://www.youtube.com/watch?v=N8a7IFPAPXs)
4. [Automated testing of C++ code with frameworks - part 1](https://letsdev.de/en/blog/automated-testing-from-cpp-code)
5. [Automated testing of C++ code with frameworks - part 2](https://letsdev.de/en/blog/automated-testing-from-cpp-with-google-test-and-google-mock)
6. [A Comprehensive Guide to Setting Up Google Test (GTest) and Google Mock (GMock) for Unit Testing](https://chamikaramendis.medium.com/a-comprehensive-guide-to-setting-up-google-test-gtest-and-google-mock-gmock-for-unit-testing-in-fc033e3b532d)

Here is a simplified example of a final `CMakeLists.txt` file for a C/C++ project:

```cmake
# CMakeLists.txt

cmake_minimum_required(VERSION 3.25)
project(MyProject)

# Add executable and source files
add_executable(MyExecutable main.cpp other_file.cpp)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)

# Add any additional dependencies or libraries
# For example, linking with a library named "MyLibrary"
# target_link_libraries(MyExecutable PRIVATE MyLibrary)
```

Use these examples as a foundation for efficient unit testing and object mocking in your codebase.
Remember to customize this template according to your project structure, additional source files, dependencies, and any specific build requirements. This is a basic starting point, and you may need to modify it based on your project's complexity and dependencies.

### 3. **CppUTest**

- **Description:** CppUTest is a lightweight and portable unit testing framework for C and C++. It is designed for embedded systems and has a simple syntax.
- **Example Code:**

```cpp
#include "CppUTest/TestHarness.h"

TEST_GROUP(ExampleGroup) {
void setup() override {}
void teardown() override {}
};

TEST(ExampleGroup, Addition) {
CHECK_EQUAL(1 + 1, 2);
}

```

- **CMake Compatibility:** Compatible with CMake.
- **Source:** [CppUTest GitHub Repository](https://github.com/cpputest/cpputest)

### 4. **doctest**

- **Description:** doctest is a fast, simple, and feature-rich C++ test framework. It is header-only, supports modern C++, and has a clean syntax.
- **Example Code:**

```cpp
#define DOCTEST_CONFIG_IMPLEMENT
#include "doctest.h"

TEST_CASE("Example Test Case") {
CHECK(1 + 1 == 2);
}

```

- **CMake Compatibility:** Compatible with CMake.
- **Source:** [doctest GitHub Repository](https://github.com/onqtam/doctest)

### 5. **Unity**

- **Description:** Unity is a lightweight C unit testing framework that focuses on simplicity and minimalism. It is suitable for embedded systems and resource-constrained environments.
- **Example Code:**

```cpp
#include "unity.h"

void test_example_addition(void) {
TEST_ASSERT_EQUAL(2, 1 + 1);
}

```

- **CMake Compatibility:** Compatible with CMake.
- **Source:** [Unity GitHub Repository](https://github.com/ThrowTheSwitch/Unity)

## Steps for Testing Frameworks in C and C++ with CMake

Developers commonly follow a set of steps to integrate testing frameworks into C and C++ projects using CMake. Here are the typical steps:

**Choose a Testing Framework:**

- Developers first choose a suitable testing framework for their project, such as Catch2, Google Test, CppUTest, doctest, or Unity.

**Integrate Testing Framework into CMakeLists.txt:**

In the `CMakeLists.txt` file, developers include and configure the chosen testing framework. This involves specifying dependencies, including headers, and setting up any necessary configurations.

Example (for Catch2):

```cmake
# CMakeLists.txt

# Add Catch2 library
add_subdirectory(libs/Catch2)

# Set up test executable
add_executable(tests test_main.cpp your_test_file.cpp)

# Link with Catch2
target_link_libraries(tests Catch2::Catch2)

```

**Write Test Cases:**

Developers create test files containing test cases using the chosen testing framework. These test cases validate the functionality of the project's code.

Example (for Catch2):

```cpp
// test_main.cpp
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

```

```cpp
// your_test_file.cpp
#include "catch.hpp"

TEST_CASE("Example Test Case", "[example]") {
REQUIRE(1 + 1 == 2);
}

```

**Run Tests Using CTest:**

Developers use CTest, a part of CMake, to run the tests. CTest discovers and executes the test cases, providing detailed output on test results.

```bash
# Run tests from the build directory
ctest

```

**Review Test Results:**

After running tests, developers review the results to identify any failures or issues. CTest provides a summary of test outcomes.

These steps offer a basic guide for integrating and running tests in C and C++ projects using CMake. Developers may adapt the process based on the specific testing framework and project requirements.

## Real-World Integration and Running Tests in C and C++ Projects with CMake

Developers often use CMake for building, testing, and managing C and C++ projects. Here's a real-world guide on integrating and running tests:

1. **Project Setup:**

- Begin by organizing your project structure. Create a directory for your project and a separate one for tests.

```plaintext
project/
├── CMakeLists.txt
├── src/
│   └── your_source_files.cpp
└── tests/
└── CMakeLists.txt
└── test_your_source_files.cpp

```

1. **CMake Configuration:**

- In your main `CMakeLists.txt`, configure the project and include the testing directory.

```cmake
# CMakeLists.txt (project)

cmake_minimum_required(VERSION 3.10)
project(your_project)

# Add your source files
add_executable(your_executable src/your_source_files.cpp)

# Include testing directory
add_subdirectory(tests)

```

1. **Test Setup:**

- In the `tests/CMakeLists.txt`, configure the test executable.

```cmake
# tests/CMakeLists.txt

enable_testing()

# Add your test files
add_executable(tests test_your_source_files.cpp)

# Link with your project's library/executable
target_link_libraries(tests your_executable)

```

1. **Write Test Cases:**

- Create test files in the `tests/` directory using a testing framework like Catch2 or Google Test.

1. **Run Tests:**

- Execute the tests using CTest.

```bash
cd build/  # navigate to your build directory
cmake ..
cmake --build .
ctest

```

1. **Review Results:**

- CTest provides detailed results, highlighting pass or fail status for each test case.

By following these steps, you can seamlessly integrate testing into your C and C++ projects using CMake. Adapt the process based on your specific testing framework and project structure.
