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
    return Column(
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
                  height: 220,
                ),
                Positioned(
                  top: 80,
                  child: Column(
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset('assets/images/aidan.png'),
                    ],
                  ),
                ),
              ]),
        ),
        // Center(
        //   child: TextButton(
        //     onPressed: () {
        //       sharedPreferences.clear();
        //       Navigator.pushReplacementNamed(context, '/loginPage');
        //     },
        //     child: Text('Logout'),
        //   ),
        // ),
      ],
    );
  }
}
