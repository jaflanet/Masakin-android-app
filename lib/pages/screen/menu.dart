import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:masakin_app/pages/screen/food_cart.dart';
import '../../widget/widgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5C901),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 30, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama restoran',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'Rating: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Jalan Catur Darma No.23A RT 3 RW 6, Cijantung, Pasar Rebo, Jakarta Timur',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
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
        ),
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
        Expanded(child: FoodList()),
      ],
    );
  }
}
