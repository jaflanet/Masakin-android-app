import 'package:get/get.dart';
import 'package:masakin_app/models/food.dart';

class cartController extends GetxController {
  var _foods = {}.obs;

  void addItem(Food food) {
    if (_foods.containsKey(food)) {
      _foods[food] += 1;
    } else {
      _foods[food] = 1;
    }

    Get.snackbar(
      "Food Added",
      "you've add the ${food.name} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void removeItem(Food food) {
    if (_foods.containsKey(food) && _foods[food] == 1) {
      _foods.removeWhere((key, value) => key == food);
    } else {
      _foods[food] -= 1;
    }
  }

  get foods => _foods;

  get itemSubtotal =>
      _foods.entries.map((food) => food.key.price * food.value).toList();

  get total => _foods.entries
      .map((food) => food.key.price * food.value)
      .toList().reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
