import 'package:flutter/material.dart';
import 'package:shared_prefence/secondpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      color: Colors.green,
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  var kuamr=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            controller: kuamr,
          ),
          TextButton(onPressed: () async{
            final ram=await SharedPreferences.getInstance();
            kuamr.text=ram.getString('savedvalue')!;
          }, child: Text('get value')),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>dyno()));
          }, child: Text('next page'))
        ],
      ),
    );
  }
}