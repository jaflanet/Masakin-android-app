import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  // final formKey = GlobalKey<FormFieldState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    var doRegister = () {
      // print('registered');

      // final form? = formKey.currentState;
      // form.save();
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            // key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                const Text("Email"),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  // validator: validateEmail(value),
                  onSaved: (value) => _email = value,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  // validator: validateEmail(value),
                  onSaved: (value) => _password = value,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                    onPressed: doRegister, child: const Text("register")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
