import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _inactive = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _inactive ? 50 : 500,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          border: _inactive
              ? null
              : Border.all(
                  color: Color(0xFFF5C901),
                ),
          boxShadow: kElevationToShadow[6]),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 16),
            child: !_inactive
                ? TextField(
                    decoration: InputDecoration(
                        hintText: 'What do you want to eat today ?',
                        hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        border: InputBorder.none),
                  )
                : null,
          )),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_inactive ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_inactive ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: _inactive
                      ? EdgeInsets.fromLTRB(14, 14, 12, 14)
                      : EdgeInsets.fromLTRB(14, 12, 12, 14),
                  child: Icon(
                    _inactive ? Icons.search : Icons.close,
                    color: Color(0xFFF5C901),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _inactive = !_inactive;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
