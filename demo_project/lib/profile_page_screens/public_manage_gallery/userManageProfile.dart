
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../manage_profiles_creens/About_You.dart';
import '../manage_profiles_creens/Astronomic_Information.dart';
import '../manage_profiles_creens/Basic_Information.dart';
import '../manage_profiles_creens/Career Details.dart';
import '../manage_profiles_creens/Family Information.dart';
import '../manage_profiles_creens/Hobbies & Interest.dart';
import '../manage_profiles_creens/Life_Style.dart';
import '../manage_profiles_creens/Partner Preference.dart';
import '../manage_profiles_creens/Physical_Apperance.dart';

class UserManageProfile extends StatefulWidget {
  const UserManageProfile({Key? key}) : super(key: key);

  @override
  State<UserManageProfile> createState() => _UserManageProfileState();
}

class _UserManageProfileState extends State<UserManageProfile> {
  String currentButton = 'Detailed Profile';
  bool showFullProfile = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9F0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 64,
              width: size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/37.png",
                      scale: 2.8,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/images/76.png",
                    scale: 5,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ramya Kishnan',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 24),
                      ),
                      Text(
                        'krish104@gmail.com',
                        style: TextStyle(color: Colors.grey, fontSize: 13,fontFamily: "SFPRODISPLAYMEDIUM"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/76.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color(0xFFEE4B5F).withOpacity(0.63),
                            const Color(0xFFEE4B5F).withOpacity(0.63),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "31 yrs,5 ft,Never Married judasimm",
                              style: TextStyle(color: Colors.white,fontFamily: "SFPRODISPLAYMEDIUM"),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Iseraelites (Yisraelism)",
                              style: TextStyle(color: Colors.white,fontFamily: "SFPRODISPLAYMEDIUM"),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentButton = 'Detailed Profile';
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    decoration: BoxDecoration(
                                      color: currentButton == 'Detailed Profile'
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Text(
                                      'Detailed Profile',
                                      style: TextStyle(
                                        color: currentButton == 'Detailed Profile'
                                            ? const Color(0xFFEE4B5F)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PartnerPreference()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    decoration: BoxDecoration(
                                      color: currentButton == 'Partner Preference'
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Text(
                                      'Partner Preference',
                                      style: TextStyle(
                                        color:
                                        currentButton == 'Partner Preference'
                                            ? const Color(0xFFEE4B5F)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (currentButton == 'Detailed Profile') Container() else
              Container(),
            if (currentButton == 'Detailed Profile')
              Expanded(
                child: ListView(
                  children: [
                    _buildExpansionTile("About", "assets/images/43  1.png",100,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const About()));
                    }),
                    _buildExpansionTile(
                        "Basic Information", "assets/images/44.png",40,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  BasicInformation()));
                    }),
                    _buildExpansionTile(
                        "Contact Detailes", "assets/images/45.png",10,(){
                    }),
                    _buildExpansionTile(
                        "Astronomic Information", "assets/images/46.png",70,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const AstronomicInformation()));
                    }),
                    _buildExpansionTile(
                        "Physical Apperance", "assets/images/47.png",10,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const PhysicalApperance()));
                    }),
                    _buildExpansionTile("Life Style", "assets/images/48.png",90,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const LifeStyle()));
                    }),
                    _buildExpansionTile("Career Details", "assets/images/49.png",30,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const CareerDetails()));
                    }),
                    _buildExpansionTile(
                        "Hobbies & Interest", "assets/images/50.png",60,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>   HobbiesInterest()));
                    }),
                    _buildExpansionTile(
                        "Family Information", "assets/images/51.png",20,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const FamilyInformation()));
                    }),
                    SizedBox(height: 30,)
                  ],
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
  Widget _buildExpansionTile(String title, String images, int count,VoidCallback function) {
    double percentage = count.toDouble();
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(images, scale: 3),
              trailing: Image.asset(
                "assets/images/22.png",
                scale: 3,
              ),
              title: Text(
                title,
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            PercentageBar(percentage: percentage),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
  class PercentageBar extends StatelessWidget {
  final double percentage;

  const PercentageBar({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double count = percentage / 100;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child:  LinearPercentIndicator(
            //  width: 250,
              animation: true,
              barRadius: Radius.circular(10),
              lineHeight: 8.0,
              animationDuration: 2500,
              percent: count,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text('$percentage%',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),),
        )
      ],
    );
  }
}
