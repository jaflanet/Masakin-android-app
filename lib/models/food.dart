// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class DataFromAPI extends StatefulWidget {
//   @override
//   _DataFromAPIState createState() => _DataFromAPIState();
// }

// class _DataFromAPIState extends State<DataFromAPI> {
//   Future getMenuData() async {
//     var response =
//         await http.get(Uri.https('masakin-rpl.herokuapp.com', 'menu'));
//     var jsonData = jsonDecode(response.body);
//     List<Food> menus = [];

//     for (var u in jsonData) {
//       Food menu = Food(u['photo'], u['menuTitle'], u['price']);
//       menus.add(menu);
//     }
//     print(menus.length);
//     return menus;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Container(
//       child: Card(
//           child: FutureBuilder(
//               future: getMenuData(),
//               builder: (context, snapshot) {
//                 if (snapshot.data == null) {
//                   return Container(
//                     child: Center(
//                       child: Text('Loading...'),
//                     ),
//                   );
//                 } else {
//                   var dataMenu = (snapshot.data as List<Food>).toList();
//                   return ListView.builder(
//                       itemCount: dataMenu.length,
//                       itemBuilder: (context, i) {
//                         return ListTile(
//                             title: Text(dataMenu[i].name),
//                             subtitle: Text(dataMenu[i].price.toString()),
//                             trailing: Image.network(dataMenu[i].imgUrl));
//                       });
//                 }
//               }
//               )
//               ),
//     )));
//   }
// }
// class Food {
//   final String imgUrl;
//   final String name;
//   final num price;

//   Food(this.imgUrl, this.name, this.price);
// }

// // class Food {
// //   final String imgUrl;
// //   final String name;
// //   final num price;

// //   const Food({
// //     required this.imgUrl,
// //     required this.name,
// //     required this.price,
// //   });
// //   // static const List<Food> generatedFood = [
// //   //   Food(
// //   //       imgUrl:
// //   //           'https://www.resepistimewa.com/wp-content/uploads/cara-membuat-ayam-bakar-kecap.jpg',
// //   //       name: 'Ayam Bakar',
// //   //       price: 20000),
// //   //   Food(
// //   //       imgUrl:
// //   //           'https://selerasa.com/wp-content/uploads/2015/12/images_daging_ayam-goreng-1200x720.jpg',
// //   //       name: 'Ayam goreng',
// //   //       price: 16000),
// //   //   Food(
// //   //       imgUrl:
// //   //           'https://img-global.cpcdn.com/recipes/7fa7fdc21d48af83/680x482cq70/nasi-ayam-bakar-foto-resep-utama.jpg',
// //   //       name: 'Paket Ayam Bakar',
// //   //       price: 24000),
// //   //   Food(
// //   //       imgUrl:
// //   //           'https://sajilicious.com/wp-content/uploads/2020/06/Sajilicious_nasi-ayam-goreng-berempah-Shah-Alam.jpg',
// //   //       name: 'Paket Ayam goreng',
// //   //       price: 22000),
// //   // ];
// // }
