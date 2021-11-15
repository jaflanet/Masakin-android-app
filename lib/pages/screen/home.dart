import 'package:flutter/material.dart';
import 'package:masakin_app/components/searchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon searchIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFF4B100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Hello, <User>',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ]),
            SizedBox(height: 30),
            SearchBar()
          ],
        ),
      ),
    );
  }
}
