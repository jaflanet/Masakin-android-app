import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:masakin_app/models/restaurant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final resto = Restaurant.generateRestaurant();

  Icon searchIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5C901),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
              ),
            ),
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/splash.png',
                      height: 60,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Masak.in',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, <User>',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('What do you want to eat today ?'),
                    ],
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF4B100),
                          boxShadow: kElevationToShadow[6],
                        ),
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                carouselSlider(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Available Restaurant',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider carouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 150,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(seconds: 2),
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
    );
  }
}
