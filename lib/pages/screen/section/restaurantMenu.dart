import 'package:flutter/material.dart';
import 'package:masakin_app/pages/models/restaurant.dart';

class RestaurantInfo extends StatelessWidget {
  final resto = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFDFBF2),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFFEF7D8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resto.name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [Text(resto.location)],
                          )
                        ])
                  ],
                )
              ],
            ),
          ),
        )
        )
        );
  }
}
