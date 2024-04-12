import 'package:flutter/material.dart';

class Communications extends StatelessWidget {
  const Communications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9F0),
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
            "Communications",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _boxbuilder("assets/images/118.png", "Chat Request Received"),
            const SizedBox(height: 20,),
            _boxbuilder("assets/images/119.png", "Photo Request"),
            const SizedBox(height: 20,),
            _boxbuilder("assets/images/120.png", "Doc Request"),
            const SizedBox(height: 20,),
            _boxbuilder("assets/images/121.png", "Contact Request"),
            const SizedBox(height: 20,),
            _boxbuilder("assets/images/123.png", "Sent"),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
  Widget _boxbuilder(String icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                scale: 3,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
          Image.asset("assets/images/22.png", scale: 3),
        ],
      ),
    );
  }
}
