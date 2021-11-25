import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';
import 'package:masakin_app/pages/screen/section/foodListView.dart';
import 'package:masakin_app/pages/screen/section/restaurantInfo.dart';
import 'package:masakin_app/widget/customAppBar.dart';

class restaurantMenu extends StatelessWidget {
  var selected = 0;
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customAppBar(Icons.arrow_back_ios_new_outlined),
        restaurantInfo(),
        FoodList(restaurant)
      ],
    )));
  }
}
