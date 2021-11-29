import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masakin_app/pages/screen/section/foodCart.dart';
import '../../widget/widgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
          body: Column(
            children: [
              foodList(),
              ElevatedButton(onPressed: 
              ()=> Get.to(()=>foodCart()), 
              child: Text('cart'),
              ),
            ],
          )
    )
    );
  }
}
