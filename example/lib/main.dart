import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            height: 500,
            width: 500,
            color: Colors.white,
            child: Center(
              child: Text(
                'This is your white bo',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Box Popup Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showCustomDialog(context); // Call the _showCustomDialog function on button click
          },
          child: Text('Show Custom Box'),
        ),
      ),
    );
  }
}