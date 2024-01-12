// ignore_for_file: avoid_print

// This is the app "entry point".
void main() {
  var person1 = Person('Robbin');
  person1.printProps();
  person1.changeProps(age: 80);
  person1.printProps();
  var person2 = Person.printInfo('Jim');
  person2.printProps();
  
}

// A class declaration/definition with a two constructors.
class Person {
  String myName;
  int age;
  int birthYear;

  // Explicit greedy constructor with one positional parameter
  // and two named parameters that are optional.
  // Only the constructor/s can use the "this" key word in their
  // parameter list.
  Person(this.myName, {this.age = 0, this.birthYear = 1960});
  // a Named constructor
  Person.printInfo(this.myName, {this.age = 0, this.birthYear = 1960}) {
    print('My name is: $myName and my age is: $age and my birth year is: $birthYear');
  }
  // changeProps is a method so it cannot use the "this" key word
  // in the parameter list, but the parms must still have default values.
  void changeProps({String name = 'hey man', int age = 0}) {
    // Because of different property and parameter names
    // we can do the following.
    myName = name;
    // When a parameter name is the same as the property name
    // we must use "this" to distinguish.
    this.age = age;
  }

  void printProps() {
    print('My name is: $myName');
    print('My age is: $age');
    print('My birth year is: $birthYear');
  }
}
