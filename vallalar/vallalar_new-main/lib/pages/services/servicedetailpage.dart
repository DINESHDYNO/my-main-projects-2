import 'package:flutter/material.dart';

class ServiceDetailPage extends StatefulWidget {
  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.asset(
                            'assets/bgvallalar.png',
                            width: double.infinity,
                            color: Color(0xffffbb00),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child: Column(
                            children: [
                              SizedBox(height: 80,),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(right: 23,left: 23),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xfff0f0f0),
                                        offset: Offset(0, 2),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        // onTap: () {
                                        //   Navigator.push(
                                        //     context,
                                        //     PageTransition(
                                        //       type: PageTransitionType.rightToLeft,
                                        //       child: ServiceList(),
                                        //     ),
                                        //   );
                                        // },
                                        child: Container(

                                          margin: EdgeInsets.only(bottom: 10),
                                          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                          decoration: BoxDecoration(

                                            color: Color(0xfff5f5f5),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 38,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  color: Color(0xfffabc13),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Center(child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,)),
                                              ),
                                              Text("பாடல் 66",
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14,
                                                    color: Color(0xff626262),
                                                    fontWeight: FontWeight.w600
                                                  // color: (index == currentIndex) ? primaryColor : greyColor,
                                                ),
                                              ),
                                              Container(
                                                width: 38,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  color: Color(0xfffabc13),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Center(child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text("66. சும்மாதே பார்த்திருக்கச் சுத்தியா முத்தமர்க்குத் தம்மாய்வார்க் கோருரையே சஞ்சீவ - மென்மேலு மாற்றஞ் சகுனப்புள் வாக்கு",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600
                                          // color: (index == currentIndex) ? primaryColor : greyColor,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 17,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15,left: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Image.asset(
                                      'assets/arrowicon.png',
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Text(
                                      'சத்திநிபாதத்து உத்தமர் ஒழிவு',
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
                                  SizedBox(width: 20,),
                                  Image.asset(
                                    'assets/settingsicon.png',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 23,right: 23,top: 20),
                      child: Text("இ-ள்.) உனை உணர்த்தின் பாசம் உதவி உடையோன் தனை உணர்த்தின் நீயே தலம் ஆம்- பசுவாகிய உன்னை அறிவிக்குமிடத்தும், உன்னை அநாதியிலே மறைத்து நின்ற பாசத்தை அறிவிக்குமிடத்தும், பெத்தமுத்தி என்னும் இரண்டு காலத்தும் உயிர்த்துணையாய் இருந்து உனக்கு உபகரிக்கும் பதியை அறிவிக்கு மிடத்தும், நீயே மற்றைய இரண்டிற்கும் இடமாகும்; (அஃதெங்ஙனமெனில்) கனலை விறகு இடம் ஆய்க் காணில் அதன் வெம்மையை வேறு ஆக்கி அறியகிலாப்போல் அது நீ ஆம்- அக்கினியைக் காட்டத்தினிடமாய்க் கடைந்து காணின், அவ்வக்கினி வேறு உட்டணம் வேறாய்ப் பிரித்து அறியக்கூடாதது போலச் சுவாநுபவத்தால் மலத்தினை நீங்கி உன்னை உள்ளபடி அறியின், நீவேறு சிவம் வேறாய்த் தோற்றாது ஆகலின், அச்சிவம் நீயாகும். 8 (வி-ரை.) காட்டத்தில் அடங்கியிருந்த தீ கடைந்த போது தோற்றினாற்போல், முன் மலபந்தத்தால் தோற்றாதிருந்த ஆன்மா இப்போது சுருதி குரு சுவாநுபவத்தால் தோற்றலின், கனலைவிறகிடமாய்க்காணில் என்றும், அதில் தோற்றிய தீயில் உட்டணமும் பிரகாசமும் இருத் தல்போல், தன்னை உள்ளபடி கண்ட ஆன்மாவினிடத்து ஆநந்தமும் அவ்வாநந்தம் மேன்மேல் விளைவதும் இருத்தலின்,'அதன் வெம்மையை வேறாக்கி யறியகிலாப்போல் என்றும், இரண்டிற்கும் நீயே தலம் என்றுங் கூறினார். அக்கினியைப்போல் பசு, சூடுபோல் சிவம், பிரகாசம் போல் பாசம் என அறிக. ஆநந்தம் சிவம், ஆநந்தத்தை யநுபவிப்பது ஆன்மா, ஆனந்தத்தை விளைப்பது மலம் என அறிக. தத்துவமசி வாக்கியார்த்தமும் இங்ஙனம் காண்க என்று அதுநீயாம் என்றார். இத்திருவெண்பாவால் முத்தியிலும் மும்முதலும் பிரிவற்றிருக்கும் என்று அறிவித்தவாறு காண்க"
                        ,style: TextStyle(
                            fontFamily: 'Montserrat',
                            height: 1.5,
                            fontSize: 13.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 20,bottom: 20,
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
    );
  }
}
