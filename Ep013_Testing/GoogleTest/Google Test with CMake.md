# Let's break down the step-by-step process for writing and executing tests using Google Test and Google Mock in a CMake project, along with a real-world scenario

## Step 1: Setup Google Test with CMake

**Include Google Test in Your Project:**

- Add Google Test as a dependency in your CMake project.
- Example (CMakeLists.txt):

```cmake
# Add Google Test as a dependency
include(FetchContent)
FetchContent_Declare(
googletest
URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip
)
FetchContent_MakeAvailable(googletest)
```

**Configure Your Project:**

- Configure your CMake project to use Google Test.
- Example (CMakeLists.txt):

```cmake
# Configure your project to use Google Test
add_executable(your_project_test your_test_files.cpp)
target_link_libraries(your_project_test gtest gmock)
```

### Step 2: Writing Tests with Google Test

**Write Test Cases:**

- Use the `TEST` macro to define test cases.
- Encompass various scenarios and functions in your C/C++ code.
- Example (test_file.cpp):

```cpp
TEST(TestSuiteName, TestName) {
// Test logic and assertions using Google Test macros
EXPECT_EQ(expected_value, actual_value);
}
```

1. **Fixture Support:**

- Implement fixtures for shared setup and teardown logic.
- Use `TEST_F` to define test cases with fixtures.
- Example (test_file.cpp):

```cpp
class FixtureName : public ::testing::Test {
protected:
void SetUp() override {
// Fixture setup logic
}

void TearDown() override {
// Fixture teardown logic
}
};

TEST_F(FixtureName, TestName) {
// Test logic using the fixture
}
```

### Step 3: Google Mock for Object Mocking

**Include Google Mock in Your Project:**

- Add Google Mock as a dependency alongside Google Test.
- Example (CMakeLists.txt):

```cmake
# Add Google Mock as a dependency
include(FetchContent)
FetchContent_Declare(
googlemock
URL https://github.com/google/googlemock/archive/refs/tags/release-1.11.0.zip
)
FetchContent_MakeAvailable(googlemock)
```

```   **Mocking Objects:**

- Define mock classes using the `MOCK_METHOD` macro.
- Mirror the interfaces of real objects.
- Example:

```

```cpp
class MockObject {
public:
MOCK_METHOD(return_type, method_name, (parameters));
};
```

### Step 4: Integration and Execution

**Link Mock Library with Test Executable:**

- Link Google Mock library with your test executable.
- Example (CMakeLists.txt):

```cmake
target_link_libraries(your_project_test gtest gmock)
```

1. **Run Tests Using CTest:**

- Use CTest, the testing tool that comes with CMake.
- Discover and execute your tests.
- Example:

```bash
# Run tests using CTest
ctest
```

### Real-world Scenario

Consider a scenario where you have a class `Calculator` with various arithmetic operations. You want to write tests to ensure the correctness of these operations and mock external dependencies.

```cpp
// Calculator.h
class Calculator {
public:
virtual int add(int a, int b);
virtual int multiply(int a, int b);
};

// Calculator.cpp
int Calculator::add(int a, int b) {
return a + b;
}

int Calculator::multiply(int a, int b) {
return a * b;
}
```

In your test file:

```cpp
// CalculatorTest.cpp
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "Calculator.h"

// Mock class for Calculator
class MockCalculator : public Calculator {
public:
MOCK_METHOD(int, add, (int a, int b), (override));
MOCK_METHOD(int, multiply, (int a, int b), (override));
};

TEST(CalculatorTest, Add) {
MockCalculator mockCalculator;

// Set expectations for the mock object
EXPECT_CALL(mockCalculator, add(2, 3))
.WillOnce(::testing::Return(5));

// Use the mock object in the test
int result = mockCalculator.add(2, 3);

// Verify the result
EXPECT_EQ(result, 5);
}

// Similar tests for other operations...
```

This real-world scenario demonstrates how to use Google Test and Google Mock in a CMake project, covering setup, writing tests, and incorporating mock objects for unit testing.
