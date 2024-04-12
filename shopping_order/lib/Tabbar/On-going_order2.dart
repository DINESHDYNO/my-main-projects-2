import 'package:flutter/material.dart';
import 'package:shopping_order/Tabbar/On-going_order.dart';

class On_going_order2 extends StatelessWidget {
  const On_going_order2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 19,
                right: 15,
              ),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 10,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ], borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/images/raja.jpg',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, top: 20),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name of the customer",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(height: 15,),
                                    Text("Product brand",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(height: 15,),
                                    Text("Product Name",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(height: 15,),
                                    Text("Quantity",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(height: 15,),
                                    Text("Price",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(height: 15,),
                                    Text("Delivery",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(height: 15,),
                                    Text("Address",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(height: 35,),
                                    Text("Phone number",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 13,),
                              Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ": DINESH DINO",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(height: 15,),
                                      Text(": Royal",style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),),
                                      SizedBox(height: 15,),
                                      Text(": 20 lit",style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),),
                                      SizedBox(height: 15,),
                                      Text(": 10 Cans",style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),),
                                      SizedBox(height: 15,),
                                      Text(": ₹ 400",style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),),
                                      SizedBox(height: 15,),
                                      Text(": 5 km",style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),),
                                      SizedBox(height: 15,),
                                      Text(": 11/2,Y street,T nagar,",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16,
                                            wordSpacing: 4),),
                                      Text("   Chennai-600001.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16,
                                            wordSpacing: 4),),
                                      SizedBox(height: 15,),
                                      Text(": +91 73********",style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ": ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 16,
                                                wordSpacing: 4),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 36,
              bottom: 43,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Delivered',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
