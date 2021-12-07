import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masakin_app/controllers/cart_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widget/widgets.dart';

class orderSummary extends StatefulWidget {
  const orderSummary({ Key? key }) : super(key: key);

  @override
  _orderSummaryState createState() => _orderSummaryState();
}

class _orderSummaryState extends State<orderSummary> {
  final cartController controller = Get.find();

  order(List orderlist) async {
    final response = await http.post(
      Uri.parse('https://masakin-rpl.herokuapp.com/testOrder'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, List>{
        "orderMenu": orderlist,
      }),
    );

    if (response.statusCode == 200) {
      print("success");
      controller.clearList();
      // successDialog(context);
    } else {
      print("failed");
    }
  }

    createAlertDialog(BuildContext context2) {
    return showDialog(
      context: context2,
      builder: (context2) {
        return AlertDialog(
          title: Text('Order Processed'),
          content: Column(
            children: [
              // Text(controller.foodlist()),
              Text('Scan to pay ${controller.getTotal()}'),
              ConfirmButton(context2),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customAppBar(Icons.arrow_back_ios_new_outlined),
        orderButton2(context),
      ],
    ));
  }

  Container orderButton2(BuildContext context) {
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

   Widget ConfirmButton(BuildContext context2 ){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
      child: TextButton(
          onPressed: () {
            order(controller.foodlist());
            Navigator.pushReplacementNamed(context, '/mainPage');
            Navigator.pop(context2);
          },
          child: Text('Ok',
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
// class orderSummary extends StatelessWidget {
//   orderSummary({ Key? key }) : super(key: key);
//   final cartController controller = Get.find();

//   order(List orderlist) async {
//     final response = await http.post(
//       Uri.parse('https://masakin-rpl.herokuapp.com/testOrder'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, List>{
//         "orderMenu": orderlist,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print("success");
//       controller.clearList();
//       // successDialog(context);
//     } else {
//       print("failed");
//     }
//   }

//     createAlertDialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Order Processed'),
//           content: Column(
//             children: [
//               // Text(controller.foodlist()),
//               Text('Scan to pay ${controller.getTotal()}'),
//               ConfirmButton(context),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child : Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         customAppBar(Icons.arrow_back_ios_new_outlined),
//         orderButton2(context),
//       ],
//     ));
//   }

//   Container orderButton2(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
//       child: TextButton(
//           onPressed: () {
//             createAlertDialog(context);
           

//           },
//           child: Text('Order',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//               )),
//           style: TextButton.styleFrom(
//             elevation: 6,
//             padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
//             backgroundColor: Color(0xFFF5C901),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
//           )),
//     );
//   }

//    Widget ConfirmButton(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
//       child: TextButton(
//           onPressed: () {
//             // order(controller.foodlist());
//             Navigator.pushReplacementNamed(context, '/menuPage');
//             Navigator.pop(context);
//           },
//           child: Text('Ok',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//               )),
//           style: TextButton.styleFrom(
//             elevation: 6,
//             padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 15.0),
//             backgroundColor: Color(0xFFF5C901),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(37)),
//           )),
//     );
//   }
// }