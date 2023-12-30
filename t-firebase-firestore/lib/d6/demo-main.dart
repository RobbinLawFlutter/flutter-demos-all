// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/d6/services/authorization.dart';

//https://firebase.google.com/docs/auth/flutter/start

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D6 - Firebase-Auth',
        ),
      ),
      body: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  String email = "", password = "";

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build started');
    Authorization().listen();
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'current user name: ${Authorization().currentUser?.displayName}'),
            const SizedBox(
              height: 20,
            ),
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
                  onPressed: () async {
                    try {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        //textEditingController1.clear();
                        //textEditingController2.clear();
                      }
                      await Authorization().signUp(email, password);
                      //email = '';
                      //password = '';
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("Log In"),
                  onPressed: () async {
                    try {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        //textEditingController1.clear();
                        //textEditingController2.clear();
                      }
                      await Authorization().logIn(email, password);
                      //email = '';
                      //password = '';
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("Log Out"),
                  onPressed: () async {
                    try {
                      await Authorization().logOut();
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
