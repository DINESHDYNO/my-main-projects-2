
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_order/Tabbar/otp%20verifications.dart';

class on_going_page_1 extends StatefulWidget {
  @override
  State<on_going_page_1> createState() => _on_going_page_1State();
}

class _on_going_page_1State extends State<on_going_page_1> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'On-going Orders1',
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
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name of the customer",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Product brand",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Quantity",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Text(
                                        "Phone number",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                            fontSize: 16,
                                            wordSpacing: 4),
                                      ),
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
                                SizedBox(
                                  width: 13,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ": RAM KUMAR",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": Royal",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": 20 lit",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": 10 Cans",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": ₹ 400",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": 5 km",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": 11/2,Y street,T nagar,",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        Text(
                                          "   Chennai-600001.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          ": +91 73********",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
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
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: Size(170, 50),
                            side: BorderSide(width: 2, color: Colors.green)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>otpverification()));
                        },
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 9,
                bottom: 123,
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green),
                  child: ExpansionTile(
                    trailing: Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Out for delivery',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    children: [
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>otpverification()));
                          },
                          title: const Text(
                            'Delivered',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
