import 'package:flutter/material.dart';

import '../../constant/Constant.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          width: size.width,
          padding: const EdgeInsets.all(10),
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/38.png",
                  color: Colors.black,
                  scale: 3,
                )),
            title: const Text(
              "About You",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Tell about you",
                style: pink15RegularTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 184,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Write About you...",
                    hintStyle: TextStyle(
                        color: const Color(0xff080808).withOpacity(
                          0.5,
                        ),
                        fontSize: 16,
                        fontFamily: "SFPRODISPLAYMEDIUM"),
                    border: InputBorder.none),
                minLines: 3,
                maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
