import 'dart:async';
import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'OnbordingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        fontFamily: 'SFPRODISPLAYBOLD'
      ),
      home: const SplashScreen(),
      color: Colors.green,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnboardingPage()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath+"Splash.png"),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}