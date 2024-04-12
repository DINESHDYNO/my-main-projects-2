import 'package:flutter/material.dart';

import '../../constant/Constant.dart';

class Notification_Site extends StatelessWidget {
  const Notification_Site({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/38.png",color: Colors.black,scale: 3,)
          ),
          title: const Text(
            "Notification",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: const Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                      ),child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height:58,
                              width: 58,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/${index + 107}.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                             SizedBox(width: 10,),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("01 Day ago",style: TextStyle(color: Color(0xff72797F),fontFamily: "SFPRODISPLAYMEDIUM"),),
                                      Container(
                                        height: 10,width: 10,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: primaryColor
                                      ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  const Text('Christofer Campbell has expressed inte..',style: TextStyle(fontSize: 17,),maxLines: 1,overflow: TextOverflow.ellipsis,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    );
                  }))
        ],
      ),
    );
  }
}
