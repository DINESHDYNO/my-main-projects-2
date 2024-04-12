import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_order/BottamNavication/Home.dart';
import 'package:shopping_order/BottamNavication/More.dart';
import 'package:shopping_order/BottamNavication/Orders.dart';
import 'package:shopping_order/BottamNavication/Products.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
      color: Colors.green,
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  int myIndex = 1;
  final List<Widget> tabs = [
    home(),
    orders(),
    products(),
    more(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        iconSize: 26,
        type: BottomNavigationBarType.fixed,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'More',
          ),
        ],
      ),
    );
  }
}