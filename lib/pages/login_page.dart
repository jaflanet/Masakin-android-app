import 'package:flutter/material.dart';
import 'package:masakin_app/utility/validator.dart';

class loginPage extends StatefulWidget {
  // const loginPage({ Key? key }) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    var doLogin = () {};
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
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
                TextButton(onPressed: (){Navigator.pushReplacementNamed(context, '/home');}, child: const Text("login")),
                TextButton(
                  child: const Text("register"), 
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/register');
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
