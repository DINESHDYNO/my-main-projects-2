import 'package:eat_kitchen_partner_app/Menu%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'RecipeDataProvider.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeDataProvider()),
      ],
      child: Menu_page(),
    ),
  );
}
}

