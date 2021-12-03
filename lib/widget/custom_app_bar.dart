import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  final IconData leftIcon;
  final Function? leftCallback;
  customAppBar(this.leftIcon, {this.leftCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        left: 25,
        right: 25,
      ),
      child: GestureDetector(
        onTap: leftCallback != null ? () => leftCallback!() : null,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Icon(leftIcon),
        ),
      ),
    );
  }
}
