import 'package:flutter/material.dart';

class ChatRequestReceived extends StatelessWidget {
  const ChatRequestReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/38.png",
              color: Colors.black,
              scale: 3,
            ),
          ),
          title: const Text(
            "Chat Request Received",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/124.png',scale: 2,),
            Text("No Result Found.",style: TextStyle(fontSize: 15,color: Color(0xff8D8D8D)),)
          ],
        ),
      ),
    );
  }
}
