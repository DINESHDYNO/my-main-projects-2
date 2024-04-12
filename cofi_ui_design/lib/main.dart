
import 'package:cofi_ui_design/Card.dart';
import 'package:cofi_ui_design/Favorite.dart';
import 'package:cofi_ui_design/Person.dart';
import 'package:cofi_ui_design/home%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AppTheme{
  static const primaryColor= Color(0xFF00512D);
  static const secondaryColor= Color(0xFFCF9F69);
  static const whiteColor= Color(0xFFFCFCFC);
  static const darkColor= Color(0xFF382E1E);
}


const Color cbrown=Color(0xFF3E2723);
const FontWeight cfont=FontWeight.w700;
const Color cgreen=Color(0xFF10542F);
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      home: Air(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Air extends StatefulWidget {
  @override
  _AirState createState() => _AirState();
}

class _AirState extends State<Air> {
  int myIndex = 0;
  final List<Widget> tabs = [
    home(),
    favorite(),
    card(),
    person(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        selectedItemColor: cgreen,
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}
