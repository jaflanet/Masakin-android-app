import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late SharedPreferences sharedPreferences;
  late String finalEmail;

  @override
  void initState() {
    super.initState();
    getAccountData();
  }

  Future getAccountData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    finalEmail = sharedPreferences.getString('email')!;
    print(sharedPreferences.getString('email'));

    var queryParameters = {'email': finalEmail};
    var response = await http.get(
        Uri.https(
            'masakin-rpl.herokuapp.com', 'account/byemail', queryParameters),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    var jsonData = jsonDecode(response.body);
    print(response.body);

    List<Account> accounts = [];

    for (var u in jsonData) {
      Account account = Account(u['name'], u['email'], u['accPhoneNumber'],
          u['profilePicture'], u['address']);
      accounts.add(account);
      print(accounts);
    }
    return accounts;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5C901),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  height: 200,
                ),
                Positioned(
                  top: 100,
                  child: FutureBuilder(
                      future: getAccountData(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: SpinKitCircle(color:Color(0xFFF5C901)),
                            ),
                          );
                        } else {
                          var dataAccount =
                              (snapshot.data as List<Account>).toList();
                          return Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFFDFBF2), width: 10),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image:
                                    NetworkImage(dataAccount[0].profilePicture),
                              ),
                            ),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: FutureBuilder(
                future: getAccountData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: SpinKitCircle(color:Color(0xFFF5C901)),
                      ),
                    );
                  } else {
                    var dataAccount = (snapshot.data as List<Account>).toList();

                    return Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          dataAccount[0].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // buildEmailText(),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  dataAccount[0].email,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xFFF5C901),
                              thickness: 3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Phone Number',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  dataAccount[0].accPhoneNumber,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xFFF5C901),
                              thickness: 3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    dataAccount[0].address,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xFFF5C901),
                              thickness: 3,
                            ),
                          ],
                        ),
                        // buildPhoneNum(),
                        // buildAddrText(),
                        buildButtonSignUp(),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  // Column buildEmailText() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 30,
  //       ),
  //       Row(
  //         children: [
  //           Icon(
  //             Icons.email_outlined,
  //             size: 30,
  //           ),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Text(
  //             'Email',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         children: [
  //           Text(
  //             'Aidankun@kunkun.com',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 18,
  //             ),
  //           ),
  //         ],
  //       ),
  //       Divider(
  //         color: Color(0xFFF5C901),
  //         thickness: 3,
  //       ),
  //     ],
  //   );
  // }

  // Column buildPhoneNum() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 30,
  //       ),
  //       Row(
  //         children: [
  //           Icon(
  //             Icons.email_outlined,
  //             size: 30,
  //           ),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Text(
  //             'Phone Number',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         children: [
  //           Text(
  //             '0877777777',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 18,
  //             ),
  //           ),
  //         ],
  //       ),
  //       Divider(
  //         color: Color(0xFFF5C901),
  //         thickness: 3,
  //       ),
  //     ],
  //   );
  // }

  // Column buildAddrText() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 30,
  //       ),
  //       Row(
  //         children: [
  //           Icon(
  //             Icons.email_outlined,
  //             size: 30,
  //           ),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Text(
  //             'Address',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         children: [
  //           Flexible(
  //             child: Text(
  //               'Jalan Catur Darma No.23A RT 3 RW 6, Cijantung, Pasar Rebo, Jakarta Timur',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       Divider(
  //         color: Color(0xFFF5C901),
  //         thickness: 3,
  //       ),
  //     ],
  //   );
  // }

  Container buildButtonSignUp() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
      child: TextButton(
          onPressed: () {
            sharedPreferences.clear();
            Navigator.pushReplacementNamed(context, '/loginPage');
          },
          child: Text('Logout',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          style: TextButton.styleFrom(
            elevation: 6,
            shadowColor: Colors.black,
            padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
            backgroundColor: Color(0xFFFF8023),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
          )),
    );
  }
}

class Account {
  final String name, email, accPhoneNumber, profilePicture, address;

  Account(this.name, this.email, this.accPhoneNumber, this.profilePicture,
      this.address);
}
