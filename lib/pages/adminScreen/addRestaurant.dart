import 'package:flutter/material.dart';

class addRestaurant extends StatelessWidget {
  const addRestaurant({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                padding: EdgeInsets.only(top: 60, left: 30, right: 30),
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: const Text(
                          'Add new restaurant',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  buildName(),
                  SizedBox(height: 20),
                  buildPhone(),
                  SizedBox(height: 20),
                  buildAddress(),
                  SizedBox(height: 30),
                  buildButtonSubmit(),
                ]
                    // child: TextButton(
                    //     child: const Text("add menu"),
                    //     onPressed: () {
                    //       Navigator.pushReplacementNamed(context, '/addMenu');
                    //     }),
                    ))));
  }

  Widget buildName() => Container(
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(),
            ),
            labelText: 'Restaurant name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );

  Widget buildPhone() => Container(
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(),
            ),
            labelText: 'Phone Number',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );

  Widget buildAddress() => Container(
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              right: 20,
              left: 20,
              top: 15,
              bottom: 5,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27),
              borderSide: BorderSide(),
            ),
            labelText: 'Address',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );

  Widget buildButtonSubmit(BuildContext context) => TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/addMenu');
      },
      child: Text('Submit',
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontFamily: 'Montserrat')),
      style: TextButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
        backgroundColor: Color(0xFFFF8023),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
      ));
}
