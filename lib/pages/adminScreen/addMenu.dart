import 'package:flutter/material.dart';

class addMenu extends StatefulWidget {
  const addMenu({Key? key}) : super(key: key);

  @override
  _addMenuState createState() => _addMenuState();
}

class _addMenuState extends State<addMenu> {
  String valType = "select";
  var items = ["HALAL", "NOT-HALAL"];

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
                          'Add new menu',
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
                  buildTitle(),
                  SizedBox(height: 20),
                  buildPrice(),
                  SizedBox(height: 20),
                  buildDescription(),
                  SizedBox(height: 20),
                  // buildType(),
                  SizedBox(height: 20),
                  buildPhoto(),
                  SizedBox(height: 30),
                  buildButtonSubmit(),
                  buildButtonBack(),
                ]
                    // child: TextButton(
                    //     child: const Text("add menu"),
                    //     onPressed: () {
                    //       Navigator.pushReplacementNamed(context, '/addMenu');
                    //     }),
                    ))));
    // return Container(
    //    child: TextButton(
    //       child: const Text("back to add resto"),
    //       onPressed: () {
    //         Navigator.pushReplacementNamed(context, '/addResto');
    //       }),
    // );
  }

  Widget buildButtonSubmit() => TextButton(
      onPressed: () {
        // Navigator.pushReplacementNamed(context, '/addMenu');
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

  Widget buildButtonBack() => TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/addResto');
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

  Widget buildTitle() => Container(
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
            labelText: 'Menu name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );

  Widget buildPrice() => Container(
        child: TextFormField(
          keyboardType: TextInputType.number,
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
            labelText: 'Menu price',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );

  Widget buildDescription() => Container(
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
            labelText: 'Description',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );

  // Widget buildType() => Container(
  //       child: TextFormField(
  //         decoration: InputDecoration(
  //           contentPadding: EdgeInsets.only(
  //             right: 20,
  //             left: 20,
  //           ),
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(27),
  //             borderSide: BorderSide(),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(27),
  //             borderSide: BorderSide(),
  //           ),
  //           labelText: 'TYPE NANTI DROPDOWN',
  //           labelStyle: TextStyle(
  //             color: Colors.black,
  //             fontSize: 14,
  //             fontFamily: 'Montserrat',
  //           ),
  //         ),
  //       ),
  //     );

  // Widget buildType() => DropdownButton(
  //   hint: Text("Select type"),
  //   value: valType,
  //   icon: Icon(Icons.keyboard_arrow_down),
  //   items: items.map((String items){
  //     return DropdownMenuItem(child: Text(items),
  //     value: items,);
  //   }).toList(),
  //   onChanged: (String newValue){
  //     setState((){
  //       valType = newValue;
  //     });
  //   },
  // )

  Widget buildPhoto() => Container(
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
            labelText: 'PHOTO NANTI UPLOAD FOTO',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );
}
