// ignore_for_file: avoid_print

// This is the app "entry point".
void main() {
  var person1 = Person('Robbin');
  person1.printFields();
  // Notice that the order of named parameters does NOT matter.
  person1.changeFields(birthYear: 1960, age: 80);
  person1.printFields();
  var person2 = Person.printInfo('Jim', age: 20, birthYear: 1990);
  person2.printFields();
  
}

// A class declaration/definition with a two constructors.
class Person {
  // Three fields
  String myName;
  int age;
  int birthYear;

  // Explicit greedy constructor with one positional
  // parameter that is required,
  // and two named parameters that are optional,
  // but initialized to 0.
  // Only the constructor/s can use the 
  // "this" key word in their parameter list.
  Person(this.myName, {this.age = 0, this.birthYear = 0});

  // A named constructor
  Person.printInfo(this.myName, {this.age = 0, this.birthYear = 0}) {
    print('My name is: $myName and my age is: $age and my birth year is: $birthYear');
  }
  // changeProps is a method so it cannot use 
  // the "this" key word in the parameter list.
  // If the calling code does not send an optional
  // parm, it will be null thus the ?
  void changeFields({String? name, int? age, int? birthYear}) {
    // Because the parm can be null we need to
    // check before we update the field.
    // Because of different field and parameter
    // names we can do not need "this".
    if(name != null){
      myName = name;
    }
    // When a parameter name is the same 
    // as the field name
    // we must use "this" to distinguish.
    if(age != null){
      this.age = age;
    }
    if(birthYear != null){
      this.birthYear = birthYear;
    }
  }

  void printFields() {
    print('My name is: $myName');
    print('My age is: $age');
    print('My birth year is: $birthYear');
  }
}
