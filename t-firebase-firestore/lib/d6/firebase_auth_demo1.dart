// ignore_for_file: avoid_print, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

//https://firebase.google.com/docs/auth/flutter/start

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  String email = "", password = "";

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build started');
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Auth listen; No User');
      } else {
        print('Auth listen: email= ${user.email} name= ${user.displayName}');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('current user name: ${FirebaseAuth.instance.currentUser?.displayName}'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: textEditingController1,
                onChanged: (value) {
                  //print(value);
                },
                onFieldSubmitted: (text) {
                  if (formKey.currentState!.validate()) {}
                  print('Submitted Email Text = $text');
                },
                validator: (input) {
                  return input!.contains('@') ? null : 'hey it must include @';
                },
                onSaved: (input) {
                  print('onSaved email = $input');
                  email = input.toString();
                },
                //cursorColor: colorScheme.onPrimary,
                maxLength: 30,
                decoration: const InputDecoration(
                  //The border property is what makes a outlined
                  //textformfield instead of a filled one.
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.email,
                    //color: colorScheme.onBackground,
                  ),
                  labelText: 'email',
                  helperText: 'must include @',
                  suffixIcon: Icon(
                    Icons.check_circle,
                    //color: colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: textEditingController2,
                onChanged: (value) {
                  //print(value);
                },
                onFieldSubmitted: (text) {
                  if (formKey.currentState!.validate()) {}
                  //print('Submitted Password Text = $text');
                },
                validator: (input) {
                  return input!.length < 6 ? 'min 6 chars' : null;
                },
                onSaved: (input) {
                  password = input.toString();
                  print('onSaved password = $input');
                },
                //obscureText: true,
                //cursorColor: colorScheme.onPrimary,
                maxLength: 20,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.emoji_emotions,
                    //color: colorScheme.onBackground,
                  ),
                  labelText: 'password',
                  helperText: 'min 6, max 20',
                  suffixIcon: Icon(
                    Icons.check_circle,
                    //color: colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text("Sign Up"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        //textEditingController1.clear();
                        //textEditingController2.clear();
                        setState(() {});
                      }
                      signUp(email, password);
                      //email = '';
                      //password = '';
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Log In"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        //textEditingController1.clear();
                        //textEditingController2.clear();
                        setState(() {});
                      }
                      logIn(email, password);
                      //email = '';
                      //password = '';
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Log Out"),
                    onPressed: () {
                      logOut();
                      //email = '';
                      //password = '';
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(email);
      User? user = FirebaseAuth.instance.currentUser;
      print('signed up with ${user?.displayName}');
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(text: '${user?.displayName} signUp: SUCCESS').get());
      setState(() {});
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(text: 'signUp: FAILED').get());
    }
  }

  void logIn(email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('logged in');
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(text: 'logIn: SUCCESS').get());
      setState(() {});
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(text: 'logIn: FAILED').get());
    }
  }

  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('logged out');
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(text: 'logOut: SUCCESS').get());
      setState(() {});
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(text: 'logOut: FAILED').get());
    }
  }
}
