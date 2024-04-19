include(AddCatch2)

add_executable(
    unit_tests    # this will create binary(In terminal: cd build/test/Debug .unit_test.exe on windows)
    test_calc.cpp
)

list(APPEND CMAKE_MODULE_PATH ${catch2_SOURCE_DIR}/extras)
include(CTest)
include(Catch)

target_link_libraries(
    unit_tests PRIVATE calculator Catch2::Catch2WithMain    #Catch2::Catch2
)

catch_discover_tests(unit_tests)


# In Catch2, `Catch2::Catch2` and `Catch2::Catch2WithMain` are two different targets provided for CMake integration, and their usage depends on whether you need a custom main function or not.
# Choose between `Catch2::Catch2` and `Catch2::Catch2WithMain` based on your project's requirements. If you want more control over the test execution process, use `Catch2::Catch2` and provide your own main function. If simplicity and Catch2's default setup are sufficient, use `Catch2::Catch2WithMain`.