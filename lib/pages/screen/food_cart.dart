import 'package:flutter/material.dart';
import 'package:masakin_app/widget/cart_total.dart';
import '../../widget/widgets.dart';

class foodCart extends StatelessWidget {
  const foodCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFF5C901), title: Text("Your Cart")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CartProducts(),
              CartTotal(),
            ],
          ),
        ),
      ),
    );
  }
}
