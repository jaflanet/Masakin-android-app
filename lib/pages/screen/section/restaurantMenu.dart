import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';
import 'package:masakin_app/pages/screen/section/foodListView.dart';
import 'package:masakin_app/pages/screen/section/restaurantInfo.dart';
import 'package:masakin_app/widget/customAppBar.dart';
import 'package:http/http.dart' as http;

// class restaurantMenu extends StatelessWidget {
//   var selected = 0;
//   final restaurant = Restaurant.generateRestaurant();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         customAppBar(Icons.arrow_back_ios_new_outlined),
//         restaurantInfo(),
//         // FoodList(restaurant)
//       ],
//     )));
//   }
// }

class DataFromAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  Future getMenuData() async {
    var response =
        await http.get(Uri.https('masakin-rpl.herokuapp.com', 'menu'));
    var jsonData = jsonDecode(response.body);
    List<Menu> menus = [];

    for (var u in jsonData) {
      Menu menu = Menu(u['photo'], u['menuTitle'], u['price']);
      menus.add(menu);
    }
    print(menus.length);
    return menus;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Card(
          child: FutureBuilder(
              future: getMenuData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  var dataMenu = (snapshot.data as List<Menu>).toList();
                  return ListView.builder(
                      itemCount: dataMenu.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                            title: Text(dataMenu[i].menuTitle),
                            subtitle: Text(dataMenu[i].price.toString()),
                            trailing: Image.network(dataMenu[i].photo));
                      });
                }
              })),
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

class Menu {
  final String photo, menuTitle;
  final int price;

  Menu(this.photo, this.menuTitle, this.price);
}
