import 'package:eat_kitchen_partner_app/Menu%20page.dart';
import 'package:eat_kitchen_partner_app/Order.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List roots = [
      const order(),
      Menu_page(),
      const order(),
      const order(),
    ];
    List<String> listOfImagePaths = [
      'assets/images/bell.png',
      'assets/images/menu (3).png',
      'assets/images/graphic-progression.png',
      'assets/images/account.png',
    ];

    List<String> listOfNames = ['Order', 'Menu', 'Report', 'Profile'];

    return Scaffold(
      body: roots[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: size.width * .135,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          itemCount: 4,
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
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Image.asset(
                  listOfImagePaths[index],
                  height: size.width * .056,
                  width: size.width * .056,
                  color: index == currentIndex ? Colors.black : Colors.black38,
                ),
                Text(
                  listOfNames[index],
                  style: TextStyle(
                      fontWeight: index == currentIndex
                          ? FontWeight.w700
                          : FontWeight.w400,
                      fontSize: index == currentIndex ? 13 : 12),
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
