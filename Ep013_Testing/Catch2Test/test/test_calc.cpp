#include <catch2/catch_test_macros.hpp>
#include "calculator.h"

// test_calculator.cpp

TEST_CASE("Calculator Addition", "[calculator]") {
    calculator calc;
    REQUIRE(calc.add(2, 3) == 5);
    REQUIRE(calc.add(-5, 10) == 5);
}

TEST_CASE("Calculator Subtraction", "[calculator]") {
    calculator calc;
    REQUIRE(calc.sub(8, 3) == 5);
    REQUIRE(calc.sub(5, 10) == -5);
}

TEST_CASE("Calculator Multiplication", "[calculator]") {
    calculator calc;
    REQUIRE(calc.mul(2, 3) == 6);
    REQUIRE(calc.mul(-5, 10) == -50);
}

TEST_CASE("Calculator Division", "[calculator]") {
    calculator calc;
    REQUIRE(calc.div(8, 2) == 4);
    REQUIRE(calc.div(10, 3) == 3);  // Note: Integer division, so result is truncated
}

TEST_CASE("Calculator Modulo", "[calculator]") {
    calculator calc;
    REQUIRE(calc.mod(8, 3) == 2);
    REQUIRE(calc.mod(10, 3) == 1);
}



// TEST(calculatorTest, Add){
//     calculator calc;
//     EXPECT_EQ(calc.add(2, 3), 5);
//     EXPECT_EQ(calc.add(-2, 3), 1);
//     EXPECT_EQ(calc.add(0, 0), 0);
// }

// TEST(calculatorTest, Sub){
//     calculator calc;
//     EXPECT_EQ(calc.sub(5, 3), 2);
//     EXPECT_EQ(calc.sub(3, 5), -2);
//     EXPECT_EQ(calc.sub(0, 0), 0);
// }

// TEST(calculatorTest, Mul){
//     calculator calc;
//     EXPECT_EQ(calc.mul(2, 3), 6);
//     EXPECT_EQ(calc.mul(-2, 3), -6);
//     EXPECT_EQ(calc.mul(0, 5), 0);
// }

// TEST(calculatorTest, Div){
//     calculator calc;
//     EXPECT_EQ(calc.div(6, 3), 2);
//     EXPECT_EQ(calc.div(3, 2), 1);
//     EXPECT_EQ(calc.div(5, 2), 2);
// }

// TEST(calculatorTest, Mod){
//     calculator calc;
//     EXPECT_EQ(calc.mod(6, 4), 2);
//     EXPECT_EQ(calc.mod(5, 2), 1);
// }