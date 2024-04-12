import 'package:flutter/material.dart';

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
  final dynokey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Welcome'),
        backgroundColor: Colors.green,
        
      ),
      body: Form(
        key: dynokey,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number:',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number.';
                }
                if (RegExp(r'[a-zA-Z]').hasMatch(value)) {
                  return 'Only numbers are allowed.';
                }
                return null; // Input is valid.
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password'
              ),
            validator: (value) {
              if (value == null || value.isEmpty)
                return "please enter password ";
            }
            ),
            SizedBox(height: 20),
            GestureDetector(onTap:(){
              if(dynokey.currentState!.validate()){}
            } ,
              child:Container(
                color: Colors.blueAccent,
                child: Text('click'),
                width:60 ,
                height: 30,
              )

            )
          ],
        ),
      ),
    );
  }
}