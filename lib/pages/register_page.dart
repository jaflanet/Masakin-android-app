import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _email, _password;

  void validateInput() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print("Not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    // var doRegister = () {
    //   // print('registered');

    //   // final form? = formKey.currentState;
    //   // form.save();
    // };

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Register'),
        // ),
        body: new SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/register.png",
                    scale: 1.3,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Container(
                    padding: EdgeInsets.only(left: 75.0, right: 75.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          buildName(),
                          const SizedBox(height: 23.0),
                          buildEmail(),
                          const SizedBox(height: 23),
                          buildPassword(),
                          const SizedBox(height: 23),
                          buildPhoneNumber(),
                          const SizedBox(height: 35),
                          buildButtonSignUp(),
                          SizedBox(height: 23),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: kElevationToShadow[6],
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/loginPage');
                              },
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 9),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xFFF5C901),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // body: SingleChildScrollView(
        //   child: Stack(children: <Widget>[
        //     Positioned(
        //       top: 0,
        //       right: 0,
        //       child: Image.asset(
        //         "assets/images/login.png",
        //         scale: 1.5,
        //       ),
        //     ),
        //     Positioned(
        //       top: 15,
        //       right: 15,
        //       child: Image.asset(
        //         "assets/images/splash.png",
        //         scale: 13,
        //       ),
        //     ),
        //   ]
        // child: Container(
        //   padding: const EdgeInsets.all(40.0),
        //   child: Form(
        //     // key: formKey,
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 15.0,
        //         ),
        //         const Text("Email"),
        //         const SizedBox(
        //           height: 5.0,
        //         ),
        //         TextFormField(
        //           autofocus: false,
        //           // validator: validateEmail(value),
        //           onSaved: (value) => _email = value,
        //         ),
        //         const SizedBox(
        //           height: 20.0,
        //         ),
        //         const Text("Password"),
        //         const SizedBox(
        //           height: 5.0,
        //         ),
        //         TextFormField(
        //           autofocus: false,
        //           // validator: validateEmail(value),
        //           onSaved: (value) => _password = value,
        //         ),
        //         const SizedBox(
        //           height: 20.0,
        //         ),
        //         TextButton(
        //             onPressed: doRegister, child: const Text("register")),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
    // ));
  }

  Widget buildName() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37),
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFF5C901),
          width: 2,
        ),
        boxShadow: kElevationToShadow[6],
      ),
      child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: TextFormField(
            validator: RequiredValidator(errorText: "Required"),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(
                  color: Color(0xFF817E7E),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
                border: InputBorder.none),
          )));

  Widget buildEmail() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFF5C901),
            width: 2,
          ),
          boxShadow: kElevationToShadow[6],
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: TextFormField(
            validator: MultiValidator(
              [
                RequiredValidator(errorText: "Required"),
                EmailValidator(errorText: "Not a valid email"),
              ],
            ),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Color(0xFF817E7E),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
                border: InputBorder.none),
          ),
        ),
      );

  Widget buildPassword() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFF5C901),
            width: 2,
          ),
          boxShadow: kElevationToShadow[6],
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: TextFormField(
            obscureText: true,
            validator: MultiValidator(
              [
                RequiredValidator(
                  errorText: "Required",
                ),
                MinLengthValidator(
                  8,
                  errorText: "Password should be at least 8 characters",
                )
              ],
            ),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color(0xFF817E7E),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
                border: InputBorder.none),
          ),
        ),
      );

  Widget buildPhoneNumber() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFF5C901),
            width: 2,
          ),
          boxShadow: kElevationToShadow[6],
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: TextFormField(
            validator: MultiValidator(
              [
                RequiredValidator(
                  errorText: "Required",
                ),
              ],
            ),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: Color(0xFF817E7E),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
                border: InputBorder.none),
          ),
        ),
      );

  Widget buildButtonSignUp() => TextButton(
        onPressed: () {
          validateInput();
        },
        child: Text(
          'Sign up',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
        ),
        style: TextButton.styleFrom(
          elevation: 6,
          shadowColor: Colors.black,
          padding: EdgeInsets.fromLTRB(
            55.0,
            15.0,
            55.0,
            15.0,
          ),
          backgroundColor: Color(0xFFFF8023),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
        ),
      );
}
