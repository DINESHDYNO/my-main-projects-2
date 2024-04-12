import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class dyno extends StatefulWidget {
  const dyno({super.key});

  @override
  State<dyno> createState() => _dynoState();
}

class _dynoState extends State<dyno> {
  var kumar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: kumar,
          ),
          TextButton(onPressed: ()async{
            final value= await SharedPreferences.getInstance();
            value.setString('savedvalue', kumar.text);
          }, child: Text('Click'))
        ],
      ),
    );
  }
}
