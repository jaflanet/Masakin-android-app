import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';
import 'package:http/http.dart';

class RestaurantInfo extends StatelessWidget {
  final resto = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
        backgroundColor: Color(0xFFFDFBF2),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFEF7D8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              resto.name,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                ),
                                Container(
                                    width: c_width,
                                    child: Text(resto.location,
                                        textAlign: TextAlign.left))
                              ],
                            )
                          ]),
                    )
                  ],
                )
              ],
            ),
          ),
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
