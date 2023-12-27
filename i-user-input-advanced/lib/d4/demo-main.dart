// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_print

import 'package:flutter/material.dart';

//ListView Widget of the Week
//https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en

//TextEditingController Widget
//https://api.flutter.dev/flutter/widgets/TextEditingController-class.html

//TextFormField Widget
//https://api.flutter.dev/flutter/material/TextFormField-class.html

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D4 - Text Forms',
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
  final formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController1 = TextEditingController();

  late String? _email, _password;
  List<String> listItems = [];

  @override
  Widget build(BuildContext context) {
    print('build method is running');
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: textEditingController,
            onChanged: (value) {
              print(value);
            },
            onFieldSubmitted: (text) {
              print('Submitted Email Text = $text');
              // This if statement will only be true when
              // both TextFormFields are valid.
              if (formKey.currentState!.validate()) {
                print('the email input is now valid');
              }
            },
            validator: (input) {
              // The ! tells the compiler that input could
              // be null, and not to throw an error.
              return input!.contains('@') ? null : 'must include @ please';
            },
            onSaved: (input) {
              // The onSaved event will only be triggered
              // when the elevated button is pressed and both
              // TextFormFields are valid.
              print('onSaved email = $input');
              _email = input;
            },
            maxLength: 30,
            decoration: const InputDecoration(
              //The border property is what makes a outlined
              //textformfield instead of a filled one.
              //border: OutlineInputBorder(),
              icon: Icon(Icons.email),
              labelText: 'email',
              helperText: 'must include @',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: textEditingController1,
            onChanged: (value) {
              print(value);
            },
            onFieldSubmitted: (text) {
              print('Submitted Password Text = $text');
              if (formKey.currentState!.validate()) {
                print('the password input is now valid');
              }
              //setState(() {});
            },
            validator: (input) {
              return input!.length < 8 ? 'min 8 chars please' : null;
            },
            onSaved: (input) {
              print('onSaved password = $input');
              _password = input;
            },
            obscureText: true,
            maxLength: 20,
            decoration: const InputDecoration(
              icon: Icon(Icons.emoji_emotions),
              labelText: 'password',
              helperText: 'min 8, max 20',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      listItems.add('email = $_email , password = $_password');
                      textEditingController.clear();
                      textEditingController1.clear();
                      setState(() {});
                    }
                  },
                  child: const Text('Sign in'),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (BuildContext context, int index) {
                print('index = $index');
                return Text(
                  listItems[index],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
