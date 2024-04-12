import 'package:flutter/material.dart';
import 'package:shared_prefence_login_page/log_in_page.dart';

void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
      color: Colors.deepPurple,
    );
  }
}
