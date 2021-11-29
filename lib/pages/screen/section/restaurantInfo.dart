import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';

class restaurantInfo extends StatelessWidget {
  final resto = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.7;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    right: 14,
                  ),
                  child: Column(
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
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFF5C901),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 17,
                              ),
                              Text(
                                '${resto.rating}',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 20,
                            ),
                            Container(
                                width: c_width,
                                child: Text(resto.location,
                                    textAlign: TextAlign.left))
                          ],
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
