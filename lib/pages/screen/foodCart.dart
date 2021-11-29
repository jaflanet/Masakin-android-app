import 'package:flutter/material.dart';
import 'package:masakin_app/widget/cartTotal.dart';
import '../../widget/widgets.dart';

class foodCart extends StatelessWidget {
  const foodCart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Your Cart")),
        body: Column(
          children: [
            CartProducts(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}