import 'food.dart';

class Restaurant {
  String name;
  String address;
  // num rating;
  // String tag; //halal
  // Map<String, List<Food>> menu;
  Restaurant(this.name, this.address);

  static Restaurant generateRestaurant() {
    return Restaurant(
      'Restaurant',
      'Jalan Catur Darma No.23A RT 3 RW 6, Cijantung, Pasar Rebo, Jakarta Timur',
      // 4.7,
      // 'halal',
    );
  }
}
