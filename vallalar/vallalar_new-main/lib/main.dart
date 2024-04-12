import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:urban_home/constant/constant.dart';
import 'package:urban_home/pages/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ApiServices/api_fetch_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: MyApp(),
    ),);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vallalar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        fontFamily: 'Montserrat',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      home: SplashScreen(),
    );
  }
}
