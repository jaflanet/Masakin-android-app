import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget {
  // const loginPage({ Key? key }) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? _email, _password;

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _isLoading = false;

  login(String email, pass) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var jsonResponse = null;
    final response = await http.post(
      Uri.parse('https://masakin-rpl.herokuapp.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": pass,
      }),
    );
    jsonResponse = json.decode(response.body);
    if (jsonResponse.length == 0) {
      setState(() {
        print("login failed");
      });
    } else {
      sharedPreferences.setString('email', email);
      print("login success");
      print(response.body);
      Navigator.pushReplacementNamed(context, '/mainPage');
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validateInput() {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      login(email.text, password.text);
    } else {
      print("Not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    var doLogin = () {};
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/YUK.png'),
                  fit: BoxFit.cover)),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/login.png",
                    scale: 1.5,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Image.asset(
                    "assets/images/splash.png",
                    scale: 13,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/login_2.png", scale: 1.3),
                ),
                Container(
                  padding: EdgeInsets.only(left: 75.0, right: 75.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      buildEmail(),
                      const SizedBox(height: 23.0),
                      buildPassword(),
                      const SizedBox(height: 29),
                      buildButtonLogin(),
                      const SizedBox(height: 20),
                      const Text(
                        'Didn\'t have account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildButtonSignUp(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmail() => Container(
        child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              controller: email,
              validator: RequiredValidator(errorText: "Required"),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Color(0xFF817E7E),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  border: InputBorder.none),
            )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: Colors.white,
            border: Border.all(color: Color(0xFFF5C901), width: 2),
            boxShadow: kElevationToShadow[6]),
      );

  Widget buildPassword() => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: Colors.white,
          border: Border.all(color: Color(0xFFF5C901), width: 2),
          boxShadow: kElevationToShadow[6]),
      child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            controller: password,
            obscureText: true,
            validator: RequiredValidator(errorText: "Required"),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color(0xFF817E7E),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                border: InputBorder.none),
          )));

  Widget buildButtonLogin() => TextButton(
      onPressed: () {
        validateInput();
      },
      child: Text('Log in',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          )),
      style: TextButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        padding: EdgeInsets.fromLTRB(65.0, 15.0, 65.0, 15.0),
        backgroundColor: Color(0xFFF5C901),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
      ));

  Widget buildButtonSignUp() => TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/registerPage');
      },
      child: Text('Sign up',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          )),
      style: TextButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
        backgroundColor: Color(0xFFFF8023),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
      ));
}
