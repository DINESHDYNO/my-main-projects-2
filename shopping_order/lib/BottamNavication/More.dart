import 'package:flutter/material.dart';

class more extends StatelessWidget {
  const more({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('More',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
    );
  }
}
