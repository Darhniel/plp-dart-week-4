import 'dart:io';

// Interface
abstract class Animal {
  void makeSound();
}

// Base class
class Mammal implements Animal {
  String name;
  int age;

  Mammal(this.name, this.age);

  @override
  void makeSound() {
    print('Mammal makes a sound');
  }

  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

// Derived class
class Dog extends Mammal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print('Dog barks');
  }

  void displayInfo() {
    super.displayInfo();
    print('Breed: $breed');
  }
}

// Method to read data from file and create Dog instances
List<Dog> readDogsFromFile(String filename) {
  List<Dog> dogs = [];
  File file = File(filename);
  List<String> lines = file.readAsLinesSync();

  for (String line in lines) {
    List<String> parts = line.split(',');
    if (parts.length == 3) {
      String name = parts[0].trim();
      int age = int.tryParse(parts[1].trim()) ?? 0;
      String breed = parts[2].trim();
      dogs.add(Dog(name, age, breed));
    }
  }

  return dogs;
}

void main() {
  // Demonstrate object-oriented model
  List<Dog> dogs = readDogsFromFile('dogs.txt');

  // Demonstrate a loop
  for (Dog dog in dogs) {
    dog.makeSound(); // Override method
    dog.displayInfo(); // Inherited method override
  }
}
