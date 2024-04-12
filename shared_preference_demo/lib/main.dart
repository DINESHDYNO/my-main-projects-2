import 'package:flutter/material.dart';
import 'package:shared_preference_demo/second.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: two(),
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller:  controller,
            ),
            TextButton(onPressed: () async {
              final val = await SharedPreferences.getInstance();
              controller.text =  val.getString('savedvalue')!;
            }, child: Text('Get')),
            TextButton(onPressed: ()  {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => save()));
            }, child: Text('Go')),

          ],
        ),
      ),
    );
  }
}