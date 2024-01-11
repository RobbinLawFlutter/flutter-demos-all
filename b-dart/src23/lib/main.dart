// This is where the app starts "entry point".
void main() {
  print('This is our first Dart App');
  //Declare a variable explicitly typed.
  int number1;
  //Give the variable a value.
  number1 = 50;
  //Call a function with on argument.
  printInteger(number1);
  //Declare and initialize a variable implicitly typed.
  var number2 = 42;
  //Call a function with one argument.
  printInteger(number2);
  //Instantiate an object of type Person with "new" key word.
  //A default constructor is called.
  var p1 = new PersonOldWay();
  //Since Dart2 we do not use the "new" key word anymore.
  var p2 = PersonOldWay();
  //Because the "name" property is "public"
  //we can change it outside the class.
  p1.name = 'Jimmy';
  print(p1);
  print(p1.name);
  print(p1.age);
  p2.age = 44;
  print(p2.age);
  p1.changePropsWithPositionalParameters('John', 22);
  p1.printProps();
  //p1.changePropsWithPositionalParameters(22, 'John');
  p2.changePropsWithNamedParameters(name:'Jim', age:33);
  p2.printProps();
  p2.changePropsWithNamedParameters(age:35);
  p2.printProps();

  var p3 = PersonNewWay(name: 'Hey Man');
  p3.printProps();
  p3.changeProps(age: 80);
  p3.printProps();
  var p4 = PersonNewWay.printNameAndAge(name: 'Jimbo');
  p4.printProps();
  
}

// Define a function with one parameter.
printInteger(int aNumber) {
  // Print to console using string interpolation.
  print('The number is $aNumber.');
}

//A class declaration and definition without a constructor.
class PersonOldWay {
  //Variables inside of a class are called "properties".
  //Also they can be called "instance" fields.
  //Defaults to "public".
  //A leading "_" makes them "private" to the file.
  //Private not demonstrated here as we only have one file.
  String name = '';
  int age = 0;

  //Functions inside of a class are called "methods".
  //This one uses "positional" parameters.
  void changePropsWithPositionalParameters(String newName, int age){
    //Because of different property and parameter names
    name = newName;
    //When a parameter name is the same as the property name
    //we must use "this" to distinguish.
    this.age = age;
  }

  //This one uses "named" parameters.
  //Named parameters have to be initialized as they are optional
  //and can't be null.
  void changePropsWithNamedParameters({String name = '', int age = 0}){
    this.name = name;
    this.age = age;
  }

  void printProps(){
    print('My name is: $name');
    print('My age is: $age');
  }
}

//A class declaration/definition with a greedy constructor.
class PersonNewWay {
  String name;
  int age;

  //Explicit greedy constructor with named parameters that are all optional.
  //Only the constructor/s can use the "this" key word in their
  //parameter list.
  PersonNewWay({this.name = '', this.age = 0});
  //Multiple constructors
  PersonNewWay.printNameAndAge({this.name = '', this.age = 0}) {
    print('My name is: $name and age: $age');
  }

  void changeProps({String name = '', int age = 0}) {
    this.name = name;
    this.age = age;
  }

  void printProps() {
    print('My name is: $name');
    print('My age is: $age');
  }
}
