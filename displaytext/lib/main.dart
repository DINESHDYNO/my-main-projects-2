import 'package:flutter/material.dart';

void main() {
  runApp(const One());
}

class One extends StatelessWidget {
  const One({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Two(),
      color: Colors.green,
    );
  }
}

class Two extends StatefulWidget {
  const Two({Key? key});

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  String kumar = "";
   var buttonText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              setState(() {
                kumar="WELCOME TO FLUTTER";
              });
            },icon: Icon(Icons.ads_click),
            label: Text("Click Me!!"),),
            SizedBox(height: 20,),
            Text(kumar,
            style: TextStyle(
              fontSize: 30
            ),),
          ],
        ),
      ),
    );
  }
}
