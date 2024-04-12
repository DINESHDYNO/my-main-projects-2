import 'package:eat_user_app/constant.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Products.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List roots = [
      HomePage(),
      KitchenSetsPage(),
      HomePage(),
      HomePage(),
      HomePage(),
    ];
    List<String> listOfImagePaths = [
      'assets/images/reel.png',
      'assets/images/bag.png',
      'assets/images/house-black-silhouette-without-door.png',
      'assets/images/order.png',
      'assets/images/grocery-store.png',
    ];
    List<String> listOfImagePathsSelected = [
      'assets/images/reel1.png',
      'assets/images/bag (1).png',
      'assets/images/home1.png',
      'assets/images/clipboard1.png',
      'assets/images/shopping1-cart.png',
    ];
    List<String> listOfNames = ['Reels', 'Products', 'Home', 'Party Order', 'Order'];

    return Scaffold(
      body: roots[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: size.width * .135,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .110,
                  height: index == currentIndex ? size.width * .010 : 0,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Image.asset(
                  index == currentIndex
                      ? listOfImagePaths[index]:listOfImagePathsSelected[index],
                  height: size.width * .051,
                  width: size.width * .051,
                  color: index == currentIndex ? kPrimaryColor : Colors.black,
                ),
                Text(
                  listOfNames[index],
                  style: TextStyle(
                    color: index == currentIndex ? kPrimaryColor : Colors.black,
                    fontWeight: index == currentIndex
                        ? FontWeight.w700
                        : FontWeight.w400,
                    fontSize: index == currentIndex ? 13 : 12,
                  ),
                ),
                SizedBox(height: size.width * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
