import 'package:flutter/material.dart';
import 'package:masakin_app/utility/validator.dart';
import 'package:form_field_validator/form_field_validator.dart';

class loginPage extends StatefulWidget {
  // const loginPage({ Key? key }) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? _email, _password;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validateInput() {
    if (formkey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/mainPage');
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
                                fontFamily: 'Montserrat',
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
                      const SizedBox(height: 40),
                      const Text('Didnt have account?',
                          style: TextStyle(fontFamily: 'Montserrat')),
                      const SizedBox(height: 10),
                      buildButtonSignUp(),
                    ],
<<<<<<< HEAD
                  )
                  // child: Container(
                  //     padding: EdgeInsets.only(left: 90.0, right: 90.0),
                  //     child: Column(
                  //       children: [
                  //         const Text('Login'),
                  //         buildEmail(),
                  //         const SizedBox(height: 23.0),
                  //         buildPassword(),
                  //         const SizedBox(height: 23),
                  //         buildButtonLogin(),
                  //         const SizedBox(height: 25),
                  //         const Text('Didnt have account?'),
                  //         const SizedBox(height: 10),
                  //         buildButtonSignUp(), 
                  //       ],
                  //     ))
                  // appBar: AppBar(
                  //   title: Text('Login'),
                  // ),
                  // body: SingleChildScrollView(
                  //   child: Container(
                  //     padding: const EdgeInsets.all(40.0),
                  //     child: Form(
                  //       child: Column(
                  //         children: [
                  //           const SizedBox(
                  //             height: 15.0,
                  //           ),
                  //           const Text("Email"),
                  //           const SizedBox(
                  //             height: 5.0,
                  //           ),
                  //           TextFormField(
                  //             autofocus: false,
                  //             // validator: validateEmail(value),
                  //             onSaved: (value) => _email = value,
                  //           ),
                  //           const SizedBox(
                  //             height: 20.0,
                  //           ),
                  //           const Text("Password"),
                  //           const SizedBox(
                  //             height: 5.0,
                  //           ),
                  //           TextFormField(
                  //             autofocus: false,
                  //             // validator: validateEmail(value),
                  //             onSaved: (value) => _password = value,
                  //           ),
                  //           const SizedBox(
                  //             height: 20.0,
                  //           ),
                  //           TextButton(
                  //               onPressed: () {
                  //                 Navigator.pushReplacementNamed(context, '/home');
                  //               },
                  //               child: const Text("login")),
                  //           TextButton(
                  //             child: const Text("register"),
                  //             onPressed: () {
                  //               Navigator.pushReplacementNamed(context, '/register');
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ))),
=======
                  ),
                ),
              ],
            ),
            // child: Container(
            //     padding: EdgeInsets.only(left: 90.0, right: 90.0),
            //     child: Column(
            //       children: [
            //         const Text('Login'),
            //         buildEmail(),
            //         const SizedBox(height: 23.0),
            //         buildPassword(),
            //         const SizedBox(height: 23),
            //         buildButtonLogin(),
            //         const SizedBox(height: 25),
            //         const Text('Didnt have account?'),
            //         const SizedBox(height: 10),
            //         buildButtonSignUp(),
            //       ],
            //     ))
            // appBar: AppBar(
            //   title: Text('Login'),
            // ),
            // body: SingleChildScrollView(
            //   child: Container(
            //     padding: const EdgeInsets.all(40.0),
            //     child: Form(
            //       child: Column(
            //         children: [
            //           const SizedBox(
            //             height: 15.0,
            //           ),
            //           const Text("Email"),
            //           const SizedBox(
            //             height: 5.0,
            //           ),
            //           TextFormField(
            //             autofocus: false,
            //             // validator: validateEmail(value),
            //             onSaved: (value) => _email = value,
            //           ),
            //           const SizedBox(
            //             height: 20.0,
            //           ),
            //           const Text("Password"),
            //           const SizedBox(
            //             height: 5.0,
            //           ),
            //           TextFormField(
            //             autofocus: false,
            //             // validator: validateEmail(value),
            //             onSaved: (value) => _password = value,
            //           ),
            //           const SizedBox(
            //             height: 20.0,
            //           ),
            //           TextButton(
            //               onPressed: () {
            //                 Navigator.pushReplacementNamed(context, '/home');
            //               },
            //               child: const Text("login")),
            //           TextButton(
            //             child: const Text("register"),
            //             onPressed: () {
            //               Navigator.pushReplacementNamed(context, '/register');
            //             },
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
>>>>>>> 72c81b4d6b99d4744e65cf6860246197c166aa06
    );
  }

  Widget buildEmail() => Container(
        child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Required"),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Color(0xFF817E7E),
                      fontSize: 16,
                      fontFamily: 'Montserrat'),
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
            obscureText: true,
            validator: RequiredValidator(errorText: "Required"),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Color(0xFF817E7E),
                    fontSize: 16,
                    fontFamily: 'Montserrat'),
                border: InputBorder.none),
          )));

  Widget buildButtonLogin() => TextButton(
      onPressed: () {
        validateInput();
      },
      child: Text('Log in',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontFamily: 'Montserrat')),
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
              fontSize: 18, color: Colors.white, fontFamily: 'Montserrat')),
      style: TextButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
        backgroundColor: Color(0xFFFF8023),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
      ));
}
