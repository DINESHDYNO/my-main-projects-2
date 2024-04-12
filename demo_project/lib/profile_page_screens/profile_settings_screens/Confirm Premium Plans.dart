import 'package:flutter/material.dart';

import '../../constant/Constant.dart';
import 'PaymentOption.dart';

class ConfirmPremiumPlans extends StatelessWidget {
  const ConfirmPremiumPlans({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentOption()));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Checkout",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            "Premium Plans",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          const Text(
            "Confirm your payment through Instamojo!",
            style: TextStyle(color: primaryColor, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pay us securely through Instamojo by clicking the image below",
            style: TextStyle(color: Color(0xffA4A4A4),fontFamily: "SFPRODISPLAYMEDIUM"),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(3, 3),
                ),
              ],
              border: Border.all(
                color: const Color(0xffD9D9D9),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 10),
                      Text("Name:", style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: "SFPRODISPLAYMEDIUM")),
                      SizedBox(height: 10),
                      Text("Email:", style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: "SFPRODISPLAYMEDIUM")),
                      SizedBox(height: 10),
                      Text("Phone:", style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: "SFPRODISPLAYMEDIUM")),
                      SizedBox(height: 10),
                      Text("Amount:", style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: "SFPRODISPLAYMEDIUM")),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 10),
                      Text("Krishnan", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("krish104@gmail.com", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("9876543210", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Rs. 750.00", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
