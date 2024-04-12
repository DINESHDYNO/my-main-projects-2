import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class save extends StatefulWidget {
  const save({super.key});

  @override
  State<save> createState() => _saveState();
}

class _saveState extends State<save> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            TextButton(onPressed: () async{
              final value = await SharedPreferences.getInstance();
              value.setString('savedvalue', controller.text);
            }, child: Text('Save')),


          ],
        ),
      ),
    );
  }
}