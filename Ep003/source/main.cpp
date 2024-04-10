#include <iostream>
#include "operations.h"
#include "dog.h"
#include "log.h"


int main() {

    auto value = ((10 <=> 20) > 0);
    std::cout << std::boolalpha;
    std::cout << "value : " << value << std::endl; 

    double result = add(2, 70);
    std::cout << "result : " << result << std::endl;

    Dog dog("Fltzy");
    dog.print_info();

    log_data("Hello there", LogType::FATAL_ERROR);

    return 0;
}
