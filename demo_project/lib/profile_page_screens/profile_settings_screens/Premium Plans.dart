import 'package:flutter/material.dart';

import '../../constant/Constant.dart';
import 'Confirm Premium Plans.dart';

class PremiumPlans extends StatelessWidget {
  const PremiumPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const SizedBox(height: 20,),
          const Text("Choose Your Plan",style: TextStyle(color: primaryColor,fontSize: 20),),
          const SizedBox(height: 10,),
          const Text("Choose any pf our packages as per your need",style: TextStyle(color: Color(0xffA4A4A4),fontFamily: "SFPRODISPLAYMEDIUM"),),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
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
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Gold",style: TextStyle(fontSize: 14,color: Color(0xffA4A4A4)),),
                        Row(
                          children: [
                            const Text(
                              "₹750",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            RichText(
                              text: const TextSpan(
                                text: '₹1250',
                                style: TextStyle(
                                  color:  Color(0xffA4A4A4),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        _planbulider("Duration 45 Days"),
                        const SizedBox(height: 10,),
                        _planbulider("Access Upto 30 Numbers"),
                        const SizedBox(height: 10,),
                        _planbulider("Unlimited Chat"),
                        const SizedBox(height: 10,),
                        _planbulider("Send Messages"),
                        const SizedBox(height: 10,),
                        _planbulider("Recieve Messages"),
                        const SizedBox(height: 10,),
                        _planbulider("View Unlimited Photos"),
                        const SizedBox(height: 10,),
                        _planbulider("Request Photo/ Phone Number"),
                        const SizedBox(height: 10,),
                        _planbulider("View Unlimited Horoscope"),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPremiumPlans()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xffFFEBED),
                            ),
                            child: const Text("Purchase",style: TextStyle(fontSize: 14,color: primaryColor),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
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
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Diamond",style: TextStyle(fontSize: 14,color: Color(0xffA4A4A4)),),
                        Row(
                          children: [
                            const Text(
                              "₹1200",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            RichText(
                              text: const TextSpan(
                                text: '₹1650',
                                style: TextStyle(
                                  color:  Color(0xffA4A4A4),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        _planbulider("Duration 45 Days"),
                        const SizedBox(height: 10,),
                        _planbulider("Access Upto 30 Numbers"),
                        const SizedBox(height: 10,),
                        _planbulider("Unlimited Chat"),
                        const SizedBox(height: 10,),
                        _planbulider("Send Messages"),
                        const SizedBox(height: 10,),
                        _planbulider("Recieve Messages"),
                        const SizedBox(height: 10,),
                        _planbulider("View Unlimited Photos"),
                        const SizedBox(height: 10,),
                        _planbulider("Request Photo/ Phone Number"),
                        const SizedBox(height: 10,),
                        _planbulider("View Unlimited Horoscope"),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPremiumPlans()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xffFFEBED),
                            ),
                            child: const Text("Purchase",style: TextStyle(fontSize: 14,color: primaryColor),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _planbulider(String title){
    return  Row(
      children: [
        const Icon(Icons.done,size: 15,color: Color(0xffA4A4A4)),
        const SizedBox(width: 10,),
        Text(title,style: const TextStyle(fontSize: 14,color: Color(0xffA4A4A4),fontFamily: "SFPRODISPLAYMEDIUM"),),
      ],
    );
  }
}
