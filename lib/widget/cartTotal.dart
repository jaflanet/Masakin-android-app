import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masakin_app/controllers/cartController.dart';

class CartTotal extends StatelessWidget {
  final cartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('Order Processed'),
            content: Text('you need to pay ${controller.total}'));
      },
    );
  }

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
                Text(
                  '${controller.total}',
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
            createAlertDialog(context);
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
}
