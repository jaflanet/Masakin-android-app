import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';

class addMenu extends StatefulWidget {
  const addMenu({Key? key}) : super(key: key);

  @override
  _addMenuState createState() => _addMenuState();
}

class _addMenuState extends State<addMenu> {
  TextEditingController menu = new TextEditingController();
  TextEditingController type = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController description = new TextEditingController();

  Dio dio = new Dio();

  late File _image;
  late var image;

  Future<Response> sendFile(String url, XFile file) async {
    Dio dio = new Dio();
    var len = await file.length();
    var response = await dio.post(url,
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: len,
        } // set content-length
            ));
    return response;
  }

  Future<Response> sendForm(
      String url, Map<String, dynamic> data, Map<String, XFile?> files) async {
    Map<String, MultipartFile> fileMap = {};
    for (MapEntry fileEntry in files.entries) {
      XFile file = fileEntry.value;
      String fileName = basename(file.path);
      fileMap[fileEntry.key] = MultipartFile(
          file.openRead(), await file.length(),
          filename: fileName);
    }
    data.addAll(fileMap);
    var formData = FormData.fromMap(data);
    Dio dio = new Dio();
    return await dio.post(url,
        data: formData, options: Options(contentType: 'multipart/form-data'));
  }

  Future getImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // _image == null ? Text('No image selected.') : Image.file(_image);
  }

  Future postMenu(
      image, String menu, String type, int price, String description) async {
    print('upload started');
    //upload image
    //scenario  one - upload image as poart of formdata
    var res1 = await sendForm('http://masakin-rpl.herokuapp.com/menu', {
      'restaurantId': 5,
      'menuTitle': menu,
      'type': type,
      'price': price,
      'description': description
    }, {
      'image': image
    });
    print("res-1 $res1");
    setState(() {
      _image = image as File;
    });
  }

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
                  // buildUploadPhoto(),
                  TextButton(onPressed: getImage, child: Text('upload')),
                  SizedBox(height: 20),
                  buildTitle(),
                  SizedBox(height: 20),
                  buildPrice(),
                  SizedBox(height: 20),
                  buildDescription(),
                  SizedBox(height: 20),
                  // buildType(),
                  buildType(),
                  SizedBox(height: 30),
                  buildButtonSubmit(),
                  // buildButtonBack(),
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

  // Widget buildUploadPhoto() => FloatingActionButton.extended(
  //     label: Text("halo"),
  //     onPressed: () async {
  //       late XFile image;
  //       var imagePicker =
  //           await ImagePicker().pickImage(source: ImageSource.gallery);
  //       if (imagePicker != null) {
  //         setState(() {
  //           print("ada foto");
  //           image = imagePicker;
  //         });
  //       } else {
  //         print("gaada foto");
  //       }
  //       try {
  //         String filename = image.path.split('/').last;
  //         FormData formData = new FormData.fromMap({
  //           "image": await MultipartFile.fromFile(image.path,
  //               filename: filename, contentType: new MediaType('image', 'png')),
  //           "type": "image/png"
  //         });
  //         Response response = await dio.post(
  //             "http://masakin-rpl.herokuapp.com/menu",
  //             data: formData,
  //             options: Options(headers: {
  //               "accept": "application/json",
  //               "Content-Type": "multipart/form-data"
  //             }));
  //       } catch (e) {
  //         print(e);
  //       }
  //     });

  // Widget buildUploadPhoto() => Center(
  //       child: _image == null ? Text('No image selected.') : Image.file(_image),
  //     );
  //   floatingActionButton: FloatingActionButton(
  //   onPressed: getImage,
  //   tooltip: 'Pick Image',
  //   child: Icon(Icons.add_a_photo),
  // ),

  Widget buildButtonSubmit() => TextButton(
      onPressed: () {
        postMenu(image, menu.text, type.text, int.parse(price.text),
            description.text);
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

// Widget buildButtonBack() => TextButton(
//     onPressed: () {
//       Navigator.pushReplacementNamed(context, '/account');
//     },
//     child: Text('Back',
//         style: TextStyle(
//             fontSize: 15, color: Colors.white, fontFamily: 'Montserrat')),
//     style: TextButton.styleFrom(
//       elevation: 6,
//       shadowColor: Colors.black,
//       padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
//       backgroundColor: Color(0xFFFF8023),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
//     ));

  Widget buildTitle() => Container(
        child: TextFormField(
          controller: menu,
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
          controller: price,
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
          controller: description,
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

  Widget buildType() => Container(
        child: TextFormField(
          controller: type,
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
            labelText: 'Type',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );
}
