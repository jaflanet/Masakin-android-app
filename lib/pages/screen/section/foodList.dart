import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';

class FoodList extends StatelessWidget {
  final Function callback;
  final Restaurant restaurant;
  FoodList(this.callback,this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('food list'),
    );
  }
}
