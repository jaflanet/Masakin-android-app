import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';
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
        // FoodList(restaurant)
      ],
    )));
  }
}

//   Future<List<Restaurant>> fetchRestaurants() async {
//     final response = await http
//         .get(Uri.parse('https://masakin-rpl.herokuapp.com/restaurant'));

//     if (response.statusCode == 200) {
//       return compute(parseSubjects, response.body);
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load Subjects');
//     }
//   }

//   List<Restaurant> parseSubjects(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
//   }
// }
