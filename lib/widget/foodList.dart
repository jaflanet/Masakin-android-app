import 'package:flutter/material.dart';
import 'package:masakin_app/controllers/cartController.dart';
import 'package:masakin_app/controllers/foodController.dart';
import 'package:get/get.dart';

class foodList extends StatelessWidget {
  final foodController = Get.put(FoodController());
  foodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
          child: ListView.builder(
              itemCount: foodController.foods.length,
              itemBuilder: (BuildContext context, int index) {
                return foodListCard(index: index);
              })),
    );
  }
}

class foodListCard extends StatelessWidget {
  final CartController = Get.put(cartController());
  final FoodController foodController = Get.find();
  final int index;
  foodListCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(foodController.foods[index].imgUrl),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              foodController.foods[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text('${foodController.foods[index].price}'),
          ),
          IconButton(
              onPressed: () {
                CartController.addItem(foodController.foods[index]);
              },
              icon: Icon(
                Icons.add_circle,
              )),
        ],
      ),
    );
  }
}
