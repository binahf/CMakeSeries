#include <catch2/catch_test_macros.hpp>
#include <sstream>
#include <iostream>
#include <string>

#include "calculator.h"

extern int runApp(int argc, char **argv);

// printting out test function (cant be used with printting out project)
TEST_CASE("Test runApp function", "[runApp]") {
    // Redirection Std::cout to stringstream
    std::stringstream buffer;
    std::streambuf *prevcoutbuf = std::cout.rdbuf(buffer.rdbuf());
    runApp(1, nullptr);

    // Restore std::cout to its prewious buffer
    std::cout.rdbuf(prevcoutbuf);

    // Checke out the output
    std::string expected_output = "add(10,4): 14\nsub(10,4): 6\nmul(10,4): 40\ndiv(10,4): 2\nmod(10,4): 2\n";
    REQUIRE(buffer.str() == expected_output);
}