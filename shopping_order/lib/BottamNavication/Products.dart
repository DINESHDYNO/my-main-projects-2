import 'package:flutter/material.dart';


class products extends StatelessWidget {
  const products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
    );
  }
}
