import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masakin_app/controllers/cart_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartTotal extends StatelessWidget {
  CartTotal({ Key? key }) : super(key: key);
  final cartController controller = Get.find();

  // order(List orderlist) async {
  //   final response = await http.post(
  //     Uri.parse('https://masakin-rpl.herokuapp.com/testOrder'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, List>{
  //       "orderMenu": orderlist,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     print("success");
  //     controller.clearList();
  //     // successDialog(context);
  //   } else {
  //     print("failed");
  //   }
  // }

  // createAlertDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Order Processed'),
  //         content: Column(
  //           children: [
  //             // Text(controller.foodlist()),
  //             Text('you need to pay ${controller.getTotal()}'),
  //             ConfirmButton(context),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   '${controller.total}',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Text(
                  '${controller.getTotal()}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            orderButton(context),
          ],
        ),
      ),
    );
  }

  Container orderButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
      child: TextButton(
          onPressed: () {
            // createAlertDialog(context);
            Navigator.pushReplacementNamed(context, '/orderPage');

          },
          child: Text('Order',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          style: TextButton.styleFrom(
            elevation: 6,
            padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
            backgroundColor: Color(0xFFF5C901),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
          )),
    );
  }

  // Container ConfirmButton(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
  //     child: TextButton(
  //         onPressed: () {
  //           order(controller.foodlist());
  //           Navigator.pop(context);
  //         },
  //         child: Text('Ok',
  //             style: TextStyle(
  //               fontSize: 18,
  //               color: Colors.white,
  //               fontWeight: FontWeight.w500,
  //             )),
  //         style: TextButton.styleFrom(
  //           elevation: 6,
  //           padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
  //           backgroundColor: Color(0xFFF5C901),
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
  //         )),
  //   );
  // }
}

