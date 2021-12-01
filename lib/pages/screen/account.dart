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
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {
            sharedPreferences.clear();
            Navigator.pushReplacementNamed(context, '/loginPage');
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
