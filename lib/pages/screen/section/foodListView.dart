import 'package:flutter/material.dart';
import 'package:masakin_app/models/food.dart';
import 'package:masakin_app/models/restaurant.dart';

import 'foodItem.dart';

class FoodList extends StatelessWidget {
  // final Function callback;
  final Restaurant restaurant;
  FoodList(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        children: [
          ListView(
              foodItem()
              )
        ],
      ),
    );
  }
}
