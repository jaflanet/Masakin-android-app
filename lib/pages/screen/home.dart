import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children : [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF4B100),
                ), 
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
              ),
              Text(
                'Hello, <User>',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),
            ]
          ),
          Icon(
            Icons.search_outlined,
            size: 45,
            color: Color(0xFFF5C901),
          )
        ],
      ), 
      
    );
  }
}