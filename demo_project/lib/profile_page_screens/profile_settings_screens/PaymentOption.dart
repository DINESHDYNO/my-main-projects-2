import 'package:flutter/material.dart';

import '../../constant/Constant.dart';


class PaymentOption extends StatefulWidget {
   PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  String? selectedPaymentOption;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
              Text("Continue",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
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
            "Choose A Payment Option",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payable Now",style: TextStyle(color: Color(0xffA4A4A4), fontSize: 16),),
                Text("₹750",style: TextStyle(color: primaryColor, fontSize: 20),),
              ],
            ),
          ),
          Container(
            height: 200,
            width: size.width,
            color: Color(0xffE1F0E2),
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Win up to 50 cashback on Amazon Pay Balance",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700),maxLines: 2,)),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:  const BorderSide(
                            color: Color(0xff80DB89),
                            width: 1.0,
                          ),
                        ),
                        elevation: 0,
                        primary: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text('Apply',style: TextStyle(fontSize: 16,color: Color(0xff69B271)),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(child: Text("Win upto 50 cashback behind scratch card on Amazon Pay Balance till Feb29 |Min Rs100|Once per user",style: TextStyle(fontSize: 12,color: Color(0xffA4A4A4),fontFamily: "SFPRODISPLAYMEDIUM"),maxLines: 3,)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width,
                  child: Center(child: Text("See All Offers",style: TextStyle(fontSize: 16,color: Color(0xff69B271)),)),
                  decoration: BoxDecoration(
                    color: Color(0xffE1F0E2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
             ),
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child:Text("Payment Options",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/98.png",scale: 2,),
                    Text("Cards (Credit/Debit)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  ],
                ),
                Radio(
                  value: '',
                  groupValue: selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentOption = value.toString();
                    });
                  },
                  activeColor:primaryColor,
                ),
              ],
            ),
          ),
          _paymentType('assets/images/99.png','Wallet'),
          _paymentType('assets/images/100..png','UPI'),
          _paymentType('assets/images/101.png','Net Banking'),
          _paymentType('assets/images/102.png','Google Pay'),
          _paymentType('assets/images/103.png','Paytm'),
          _paymentType('assets/images/104.png','Whatsapp'),

        ],
      ),
    );
  }
  Widget _paymentType(String icon, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon, scale: 2),
              Text(name, style: TextStyle(fontSize: 14, color: Color(0xff8D8D8D),fontFamily: "SFPRODISPLAYMEDIUM")),
            ],
          ),
          Radio<String>(
            value: name,
            groupValue: selectedPaymentOption,
            onChanged: (String? value) {
              setState(() {
                selectedPaymentOption = value;
              });
            },
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
