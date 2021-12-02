import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    logout();
  }

  logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString('email'));
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
                  child: Container(
                    height: 165,
                    width: 165,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFDFBF2), width: 10),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/aidan.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Muhammad Aidan MADJ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                buildEmailText(),
                buildPhoneNum(),
                buildAddrText(),
                buildButtonSignUp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildEmailText() {
    return Column(
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
              'Aidankun@kunkun.com',
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
    );
  }

  Column buildPhoneNum() {
    return Column(
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
              '0877777777',
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
    );
  }

  Column buildAddrText() {
    return Column(
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
                'Jalan Catur Darma No.23A RT 3 RW 6, Cijantung, Pasar Rebo, Jakarta Timur',
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
    );
  }

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
