// ignore_for_file: use_build_context_synchronously, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/d9-TODO/services/authorization.dart';
import 'package:robbinlaw/d9-TODO/views/first.dart';
import 'package:robbinlaw/d9-TODO/views/signup.dart';
import 'package:robbinlaw/d9-TODO/widgets/mysnackbar.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Login build:');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
                controller: passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                child: const Text("Log In"),
                onPressed: () async {
                  try{
                    await Authorization().logIn(
                      emailController.text, passwordController.text);
                    ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBar(text: 'logIn: SUCCESS').get());
                  } catch(e){
                    ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBar(text: 'logIn: FAILED').get());
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => First(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
