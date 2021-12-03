import 'package:flutter/material.dart';
import 'package:masakin_app/controllers/cart_controller.dart';
// import 'package:masakin_app/models/food.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../widget/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DataFromAPI extends StatefulWidget {
  @override
  _foodList createState() => _foodList();
}

class _foodList extends State<DataFromAPI> {
  final CartController = Get.put(cartController());
  Future getMenuData() async {
    var response =
        await http.get(Uri.https('masakin-rpl.herokuapp.com', 'menu'));
    var jsonData = jsonDecode(response.body);
    List<Food> menus = [];

    for (var u in jsonData) {
      Food menu = Food(u['photo'], u['menuTitle'], u['price']);
      menus.add(menu);
    }
    print(menus.length);
    return menus;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Card(
      child: FutureBuilder(
          future: getMenuData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: SpinKitCircle(
                color: Color(0xFFF5C901),
              ));
            } else {
              var dataMenu = (snapshot.data as List<Food>).toList();
              return ListView.builder(
                itemCount: dataMenu.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(dataMenu[i].imgUrl),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            dataMenu[i].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text('${dataMenu[i].price}'),
                        ),
                        IconButton(
                            onPressed: () {
                              CartController.addItem(dataMenu[i]);
                            },
                            icon: Icon(
                              Icons.add_circle,
                            )),
                      ],
                    ),
                  );

                  // return ListTile(
                  //     title: Text(dataMenu[i].name),
                  //     subtitle: Text(dataMenu[i].price.toString()),
                  //     trailing: Image.network(dataMenu[i].imgUrl));
                },
              );
            }
          }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Flexible(
  //       child: ListView.builder(
  //           itemCount: dataMenu.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return foodListCard(index: index);
  //           }));
  // }
}

// class foodListCard extends StatelessWidget {
//   final CartController = Get.put(cartController());
//   final int index;
//   foodListCard({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundImage: NetworkImage(Food.generatedFood[index].imgUrl),
//           ),
//           SizedBox(width: 20),
//           Expanded(
//             child: Text(
//               Food.generatedFood[index].name,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text('${Food.generatedFood[index].price}'),
//           ),
//           IconButton(
//               onPressed: () {
//                 CartController.addItem(Food.generatedFood[index]);
//               },
//               icon: Icon(
//                 Icons.add_circle,
//               )),
//         ],
//       ),
//     );
//   }
// }

class Food {
  final String imgUrl;
  final String name;
  final num price;

  Food(this.imgUrl, this.name, this.price);
}
