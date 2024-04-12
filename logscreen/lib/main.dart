import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ApiProvider.dart';
import 'log_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    ChangeNotifierProvider(
      create: (context) => YourDataProvider(),
      child: one(),
    ),
  );
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Two(),
      color: Colors.green,
    );
  }
}

