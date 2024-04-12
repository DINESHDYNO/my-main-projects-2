import 'package:flutter/material.dart';

import '../../constant/Constant.dart';

class mywallet extends StatelessWidget {
  const mywallet({super.key});

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
            "My Wallet",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,),
                  height: 123,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xffFD306E),
                  ),child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/83.png",color: Colors.white,scale: 1.5,),
                    const Text("\$140.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    const SizedBox(height: 5,),
                    const Text("Wallet Balance",style: TextStyle(fontSize: 14,color: Colors.white),)
                  ],
                ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,),
                  height: 123,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xffE1E3E6),
                  ),child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/106.png",color: primaryColor,scale: 2,),
                    const SizedBox(height: 10,),
                    const Text("Recharge Wallet",style: TextStyle(fontSize: 16,color: Color(0xff72797F)),)
                  ],
                ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
             Expanded(
              child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20),
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
              ),child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date :',style: TextStyle(fontSize: 16,color: Color(0xffAAAFB3),fontFamily: "SFPRODISPLAYMEDIUM"),),
                        SizedBox(height: 10,),
                        Text('Amount :',style: TextStyle(fontSize: 16,color: Color(0xffAAAFB3),fontFamily: "SFPRODISPLAYMEDIUM"),),
                        SizedBox(height: 10,),
                        Text('Payment Method :',style: TextStyle(fontSize: 16,color: Color(0xffAAAFB3),fontFamily: "SFPRODISPLAYMEDIUM"),),
                        SizedBox(height: 10,),
                        Text('Approval :',style: TextStyle(fontSize: 16,color: Color(0xffAAAFB3),fontFamily: "SFPRODISPLAYMEDIUM"),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('25-08-2024',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('\$10.00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('Paypal',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('N/A',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
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
