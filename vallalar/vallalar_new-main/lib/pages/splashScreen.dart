import 'dart:async';
import 'package:flutter/material.dart';
import 'package:urban_home/constant/constant.dart';
import 'package:urban_home/pages/screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomBar())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/splash.png',
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                width: width,
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
