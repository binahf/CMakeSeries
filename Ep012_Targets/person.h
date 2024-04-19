#include <string>

class person {
public:
  // Getter for name
  std::string getName() const;

  // Setter for name
  void setName(const std::string &newName);

  // Getter for age
  int getAge() const;

  // Setter for age
  void setAge(int newAge);

private:
  std::string name;
  int age;
};
