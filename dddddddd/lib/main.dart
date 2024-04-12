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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ram1 = false;
  bool ram2 = false;
  bool ram3 = false;
  bool ram4 = false;

  void kumar() {
    setState(() {
      bool temp = ram1;
      ram1 = !ram3;
      ram3 = ram4;
      ram4 = ram2;
      ram2 = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Example'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (ram1)
                  Image.asset(
                    'images/dyno.png', // Replace with your image path
                    width: 200,
                    height: 200,
                  )
                else
                  Container(width: 200, height: 200,
                  ),
                SizedBox(height: 20),
                if (ram2)
                  Image.asset(
                    'images/dyno.png', // Replace with your image path
                    width: 200,
                    height: 200,
                  )
                else
                  Container(width: 200, height: 200),
                SizedBox(height: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (ram3)
                  Image.asset(
                    'images/dyno.png', // Replace with your image path
                    width: 200,
                    height: 200,
                  )
                else
                  Container(width: 200, height: 200),
                SizedBox(height: 20),
                if (ram4)
                  Image.asset(
                    'images/dyno.png', // Replace with your image path
                    width: 200,
                    height: 200,
                  )
                else
                  Container(width: 200, height: 200),
                SizedBox(height: 20),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                kumar();
              },
              child: Text('Click me!!'),
            ),
          ],
        ),
      ),
    );
  }
}
