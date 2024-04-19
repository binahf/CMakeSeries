#include <iostream>
#include <fmt/format.h>
#include "person.h"

int main(int argc, char *argv[]){
    person p("John", 42);
    std::cout << fmt::format("{} is years old.", p.getName(), p.getAge())
              << std::endl;
    person p2("Jane", 43);
    std::cout << fmt::format("{} is years old.", p2.getName(), p2.getAge())
              << std::endl;
    fmt::println("Hello, World!");
    return 0;
}