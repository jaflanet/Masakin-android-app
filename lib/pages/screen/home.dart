import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:masakin_app/widget/searchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon searchIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFF4B100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Hello, <User>',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ]),
            SizedBox(height: 20),
            SearchBar(),
            SizedBox(height: 20),
            Text(
              'Discover',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            SizedBox(height: 15),
            CarouselSlider(
              options: CarouselOptions(
                  height: 150,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: 1),
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  child: Image.asset(
                    'assets/images/contohmakanan.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Color(0xFFF5C901),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
