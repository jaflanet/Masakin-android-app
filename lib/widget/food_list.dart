import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:masakin_app/controllers/cart_controller.dart';
// import 'package:masakin_app/models/food.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../widget/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodList createState() => _FoodList();
}

class _FoodList extends State<FoodList> {
  List<Food> menus = [];
  final CartController = Get.put(cartController());
  Future getMenuData() async {
    var response =
        await http.get(Uri.https('masakin-rpl.herokuapp.com', 'menu'));
    var jsonData = jsonDecode(response.body);
    for (var u in jsonData) {
      Food menu = Food(u['photo'], u['menuTitle'], u['price']);
      menus.add(menu);
    }
    print(menus.length);
    return menus;
  }

  List<Food> foundedMenu = [];
  @override
  initState() {
    super.initState();
    setState(() {
      foundedMenu = menus;
    });
  }

  onSearch(String search) {
    setState(() {
      foundedMenu = menus
          .where((menus) => menus.name.toLowerCase().contains(search))
          .toList();
    });
  }

  search() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        onChanged: (value) => onSearch(value),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: Color(0xFFF5C901),
          ),
          hintText: 'Search here..',
          hintStyle: TextStyle(
            color: Color(0xFF817E7E),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(37),
            borderSide: BorderSide(
              color: Color(0xFFF5C901),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(37),
            borderSide: BorderSide(
              color: Color(0xFFF5C901),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMenuData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
                child: SpinKitCircle(
              color: Color(0xFFF5C901),
            ));
          } else {
            return Column(
              children: [
                search(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                  child: Container(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: foundedMenu.length,
                    itemBuilder: (context, i) {
                      return listFood(dataMenu: foundedMenu[i]);
                    },
                  ),
                ),
              ],
            );
          }
        });
  }

  listFood({required var dataMenu}) {
    double c_width = MediaQuery.of(context).size.width * 0.4;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: kElevationToShadow[1],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    dataMenu.imgUrl,
                    width: 80,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: c_width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataMenu.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Rp. ${dataMenu.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  CartController.addItem(dataMenu);
                },
                icon: Icon(
                  Icons.add_circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Food {
  final String imgUrl;
  final String name;
  final num price;

  Food(this.imgUrl, this.name, this.price);
}
