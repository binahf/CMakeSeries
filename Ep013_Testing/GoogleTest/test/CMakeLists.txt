include(AddGoogleTest)

add_executable(
    unit_tests    # this will create binary(In terminal: cd build/test/Debug .unit_test.exe on windows)
    test_calc.cpp
)

target_link_libraries(
    unit_tests PRIVATE calculator GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(unit_tests)