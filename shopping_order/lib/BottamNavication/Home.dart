import 'package:flutter/material.dart';


class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
    );
  }
}
