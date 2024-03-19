import 'dart:convert';
import 'dart:io';

abstract class Printable {
  void printDetails();
}

class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('Animal $name makes a sound.');
  }
}

class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print('Dog $name barks.');
  }

  @override
  void printDetails() {
    print('Dog: $name, Breed: $breed');
  }
}

List<Dog> createDogsFromFile(String filePath) {
  List<Dog> dogs = [];
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();

  for (String line in lines) {
    List<String> parts = line.split(',');
    if (parts.length == 2) {
      String name = parts[0];
      String breed = parts[1];
      Dog dog = Dog(name, breed);
      dogs.add(dog);
    }
  }

  return dogs;
}

void main() {
  List<Dog> dogs = createDogsFromFile('dogs.txt');

  for (Dog dog in dogs) {
    dog.printDetails();
    dog.makeSound();
  }
}
