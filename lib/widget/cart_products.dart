import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masakin_app/controllers/cart_controller.dart';
import 'package:masakin_app/models/food.dart';
import 'food_list.dart';

class CartProducts extends StatelessWidget {
  final cartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 400,
        child: ListView.builder(
            itemCount: controller.foods.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                food: controller.foods.keys.toList()[index],
                quantity: controller.foods.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final cartController controller;
  final Food food;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.food,
    required this.quantity,
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
            backgroundImage: NetworkImage(
              food.photo,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  food.menuTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${food.price}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Text('${Food.generatedFood[index].price}'),
          // ),
          IconButton(
            onPressed: () {
              controller.removeItem(food);
            },
            icon: Icon(
              Icons.remove_circle,
            ),
          ),
          Text('${quantity}'),
          IconButton(
            onPressed: () {
              controller.addItem(food);
            },
            icon: Icon(
              Icons.add_circle,
            ),
          ),
        ],
      ),
    );
  }
}
