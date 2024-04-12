import 'package:flutter/material.dart';

import '../main_screens/Chat.dart';

class ChattingPage extends StatelessWidget {
   ChattingPage({
     Key? key, required this.items
   });

   final ChatItemWidget items;

   // List <Chatlist>chatlist=[
   //   Chatlist(message: 'Did you want to a joker about joey?',date: '10:50 AM'),
   //   Chatlist(message: 'joey has already told',date: '10:50 AM'),
   //   Chatlist(message: 'You will come to the coffee shop in the evening',date: '10:50 AM'),
   //   Chatlist(message: "I'll come after work",date: '10:50 AM'),
   //   Chatlist(message: 'Will be you already there ?????',date: '10:50 AM'),
   //   Chatlist(message: "No,I'll reach coffee shop and I will call you.",date: '10:50 AM'),];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/37.png",
                        scale: 2.8,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Image.asset(
                      items.image,
                      scale: 5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                         Text(
                          items.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 24),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/images/23.png',
                          scale: 3,
                        )
                      ],
                    ),
                  ],
                ),
                Image.asset('assets/images/75.png', scale: 3),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 30,),
                const Center(
                  child: Text('January, 21',
                    style: TextStyle(fontSize: 14, color: Color(0xff8D8D8D),),),
                ),
                const SizedBox(height: 20,),
                _leftSideChater(context, "Did you want to a joker about joey?", '9:50 AM'),
                const SizedBox(height: 20,),
                _rigthSideChater(context, "joey has already told", '9:50 AM'),
                const SizedBox(height: 20,),
                _rigthSideChater(context,  "You will come to the coffee shop in the evening", '10:50 AM'),
                const SizedBox(height: 20,),
                _leftSideChater(context, "I'll come after work", '9:50 AM'),
                const SizedBox(height: 20,),
                _leftSideChater(context, "Will be you already there ?????", '9:50 AM'),
                const SizedBox(height: 20,),
                _rigthSideChater(context, "No,I'll reach coffee shop and I will call you.", '10:50 AM'),
              ],
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Row(
                children: [
                  Image.asset("assets/images/73.png", scale: 2.7,),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 4.0,
                              left: 15.0,
                              right: 15.0,
                              bottom: 5.0),
                          suffixIcon: GestureDetector(
                              onTap: (){},
                              child: Image.asset("assets/images/123.png", scale: 2.7,)),
                          prefixIcon: Image.asset("assets/images/74.png", scale: 2.7,),
                          hintText: 'Type a message...',
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _leftSideChater(BuildContext context, String content, String time) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset(items.image, scale: 5,),
          const SizedBox(width: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: size.width / 1.8,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                ),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(content, style: const TextStyle(fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20,),
                    Text(time, style: const TextStyle(fontSize: 12, color: Color(0xff8D8D8D)),),
                  ],
                )
              ],
            ),
          ),
           SizedBox(width: 10,),
           Icon(Icons.done_all,color: Color(0xff90C46B,),size: 17,)
        ],
      ),
    );
  }


  Widget _rigthSideChater(BuildContext context, String content, String time) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: size.width / 1.5,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                ),
                color: const Color(0xffEE4B5F)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(content, style: const TextStyle(fontSize: 15, color: Colors.white,fontFamily: "SFPRODISPLAYMEDIUM")),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20,),
                    Text(time, style: const TextStyle(fontSize: 12, color: Colors.white70)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


// class Chatlist{
//   Chatlist({
//     required this.message,
//     required this.date
// });
//   String message;
//   String date;
// }