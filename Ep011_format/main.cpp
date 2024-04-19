#include "person.h"
#include <iostream>

int main(void) {
  person p("John", 42);
  std::cout << p.getName() << " is " << p.getAge() << " years old."
            << std::endl;
  p.setName("Jane");
  p.setAge(43);
  std::cout << p.getName() << " is " << p.getAge() << " years old."
            << std::endl;
  return 0;
}
