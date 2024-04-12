import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:urban_home/constant/constant.dart';
import 'package:urban_home/pages/services/servicedetailpage.dart';

class ServiceListingDetails extends StatefulWidget {
  @override
  _ServiceListingDetailsState createState() => _ServiceListingDetailsState();
}

class _ServiceListingDetailsState extends State<ServiceListingDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfffabc13),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'சத்திநிபாதத்து உத்தமர் ஒழிவு',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w600
            // color: (index == currentIndex) ? primaryColor : greyColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20 ,top: 20 ,bottom: 15),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(left: 18,right: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Image.asset(
                  'assets/serachicon.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
                    widthSpace,
                    Expanded(
                      child: TextFormField(
                        style:  TextStyle(
                          color:Color(0xff4f4f4f),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: const InputDecoration(
                            hintText: 'தேடல்',
                            hintStyle: TextStyle(
                              color:Color(0xff4f4f4f),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.none,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent, // Remove the border
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ))
                        ),

                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.only(left: 18,right: 15,top: 15,bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("66. சும்மாதே பார்த்திருக்கச் சுத்தியா முத்தமர்க்குத் தம்மாய்வார்க் கோருரையே சஞ்சீவ - மென்மேலு மாற்றஞ் சகுனப்புள் வாக்கு",
                    style: TextStyle(
                        height: 1.5,
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      // color: (index == currentIndex) ? primaryColor : greyColor,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.only(left: 18,right: 15,top: 15,bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("67. முலைமுதிர நாண முதிர்ந்தடங்கி மூடிக் கலவியிலே நக்கினத்தைக் காட்டற் சலனைபய னானாலுந் தம்பனைசெய் தாநந்த",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      // color: (index == currentIndex) ? primaryColor : greyColor,
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.only(left: 18,right: 15,top: 15,bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("68. மயலற்றார் கேட்க மகிழ்ந்துரைத்த வார்த்தை அயலுக் குபதேச மாகுந் - துயிலாத் தொறுவனைப்போ னின்றுகே டூசழுக்கு நோயு",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      // color: (index == currentIndex) ? primaryColor : greyColor,
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.only(left: 18,right: 15,top: 15,bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("69. முலைமுதிர நாண முதிர்ந்தடங்கி மூடிக் கலவியிலே நக்கினத்தைக் காட்டற் - சலனைபய னானாலுந் சம்பணைசெய் சாருந்த",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      // color: (index == currentIndex) ? primaryColor : greyColor,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
