import 'package:flutter/material.dart';
import 'package:masakin_app/models/food.dart';

class foodItem extends StatelessWidget {
  final Food food;
  foodItem(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(food.name),
    );
  }
}
