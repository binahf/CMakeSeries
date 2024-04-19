#include "person.h"

person::person(const std::string &name, int age) : name(name), age(age) {}

std::string person::getName() const { return name; }

void person::setName(const std::string &newName) { name = newName; }

int person::getAge() const { return age; }

void person::setAge(int newAge) { age = newAge; }
