import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key, required this.toolbarHeight}) : super(key: key);

  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.contain,
        height: 90,
      ),
      toolbarHeight: 110,
      backgroundColor: Color(0xFFF5C901),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
