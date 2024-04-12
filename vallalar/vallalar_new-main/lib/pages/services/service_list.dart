import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:urban_home/constant/constant.dart';


import 'ServiceListing_drtail.dart';

class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfffabc13),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'புத்தகம் படிக்க',
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("சிறப்புப்பாயிரம்",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: Text(
                              "12",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("காப்புச் செய்யுள்கள்",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("4",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("பொதுவிலுபதேசம்",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("9",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("சத்திநிபாதத்து உத்தமர் ஒழிவு" ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("75",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("யோகக் கழற்றி",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("42",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("கிரியைக்கழற்றி",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("20",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("சரியை கழற்றி",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("11",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("விரத்தி விளக்கம்",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("12",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ServiceListingDetails(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 18,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("துறவு",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xfffabc13),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: Text("3",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                      )
                    ],
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
