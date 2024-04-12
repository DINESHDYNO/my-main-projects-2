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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('GridView.Builder'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          itemCount: 21,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 6, crossAxisSpacing: 6),
          itemBuilder: (context, index) {
            return Container(
              color: (index % 2 == 0) ? Colors.black : Colors.red,
              child: Center(
                  child: Text(
                '$index',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              )),
            );
          }),
    );
  }
}
