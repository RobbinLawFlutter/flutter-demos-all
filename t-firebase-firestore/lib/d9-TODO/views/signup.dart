// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/d9-TODO/services/authorization.dart';
import 'package:robbinlaw/d9-TODO/views/first.dart';
import 'package:robbinlaw/d9-TODO/widgets/mysnackbar.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('SignUp build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: "Full Name"),
                controller: nameController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
                controller: passwordController,
              ),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () async {
                  try{
                    await Authorization().createUser(nameController.text,
                      emailController.text, passwordController.text);
                    ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBar(text: 'signUp: SUCCESS').get());
                  }catch(e){
                    ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBar(text: 'signUp: FAILED').get());
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => First(),
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
