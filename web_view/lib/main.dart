import 'package:flutter/material.dart';
import 'package:web_view/page%201.dart';
import 'package:web_view/page%202.dart';
import 'package:web_view/page%203.dart';
import 'package:web_view/page%204.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Welcome'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>kumar()));
                   },
                   child: Container(
                     height: 180,
                     width: 180,
                     child: Image.asset('assets/images/page1.jpg'),
                   ),
                 ),
                 SizedBox(width: 30,),
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ram()));
                   },
                   child: Container(
                     height: 180,
                     width: 180,
                     child: Image.asset('assets/images/page2.jpg'),
                   ),
                 )
               ]
             ),
              SizedBox(height: 30,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>page3()));
                    },
                    child: Container(
                      height: 180,
                      width: 180,
                      child: Image.asset('assets/images/page3.jpg'),
                    ),
                  ),
                  SizedBox(width: 30,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>page4()));
                    },
                    child: Container(
                      height: 180,
                      width: 180,
                      child: Image.asset('assets/images/page4.jpg'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}