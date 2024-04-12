import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:urban_home/constant/constant.dart';
import 'package:urban_home/pages/services/servicedetailpage.dart';

class BookMarkPage extends StatefulWidget {
  @override
  _BookMarkPageState createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
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
                          hintText: 'தேடுங்கள்',
                          hintStyle: TextStyle(
                            color:Color(0xff4f4f4f),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.none,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              )
                          )
                      ),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20 ,top: 20 ,bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("புத்தககுறி",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                          // color: (index == currentIndex) ? primaryColor : greyColor,
                        ),
                      ),
                      SizedBox(height: 20,),
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
                        child: Stack(
                          children: [
                            Container(
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
                            Positioned(
                              right: 10,top: 10,
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Color(0xfffabc13),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Image.asset(
                                  'assets/Bookmark.png',
                                  color: Colors.white,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),),
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
                        child: Stack(
                          children: [
                            Container(
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
                            Positioned(
                              right: 10,top: 10,
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Color(0xfffabc13),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Image.asset(
                                  'assets/Bookmark.png',
                                  color: Colors.white,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                 ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
