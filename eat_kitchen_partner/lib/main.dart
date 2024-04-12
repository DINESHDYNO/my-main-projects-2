
import 'package:eat_kitchen_partner/ui/login_and_register/login_and_register.dart';
import 'package:eat_kitchen_partner/ui/login_and_register/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomAppTheme.lightAppTheme,
      home: Sample(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}
class SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver{
  bool userLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(milliseconds: 5000), () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const LandingPageBase()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/splash_screen.jpg"),fit: BoxFit.fill),
      ),),
    );
  }

}


