import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';

import '../profile_page_screens/profile_settings_screens/Chat Request Received.dart';
import '../profile_page_screens/profile_settings_screens/Communications.dart';
import '../profile_page_screens/profile_settings_screens/Blogs.dart';
import '../profile_page_screens/Change Password.dart';
import '../profile_page_screens/profile_settings_screens/Ignored User.dart';
import '../profile_page_screens/profile_settings_screens/My Happy Stories.dart';
import '../profile_page_screens/profile_settings_screens/My Interest.dart';
import '../profile_page_screens/profile_settings_screens/Notification.dart';
import '../profile_page_screens/profile_settings_screens/Premium Plans.dart';
import '../profile_page_screens/profile_settings_screens/Prospect.dart';
import '../profile_page_screens/profile_settings_screens/my_wallet.dart';
import '../profile_page_screens/public_manage_gallery/userFullProfile.dart';
import '../profile_page_screens/public_manage_gallery/userGallery.dart';
import '../profile_page_screens/public_manage_gallery/userManageProfile.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          children: [
            Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.18),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
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
                            'Krishnan',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 24),
                          ),
                          Text("krish104@gmail.com",style: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),)
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                        items: [
                          _buildPopupMenuItem("assets/images/77.png", 'FAQ', () {}),
                          _buildPopupMenuItem("assets/images/78.png", 'Contact Us', () {}),
                          _buildPopupMenuItem("assets/images/79.png", 'Change Password', () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                          }),
                          _buildPopupMenuItem("assets/images/80.png", 'Deactivate Account', () {}),
                          _buildPopupMenuItem("assets/images/81.png", 'Logout', () {}),
                        ],
                      );
                    },
                    child: Image.asset('assets/images/82.png', scale: 3),
                  )
                ],
              ),
            ),
            Expanded(
                child:
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _profilebulider("Public Profile", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const UserFullProfilePage()));
                      }),
                    ),
                    Expanded(
                      child: _profilebulider("Manage Profile", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const UserManageProfile()));
                      }),
                    ),
                    Expanded(child: _profilebulider("Gallery", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const UserGallery()));
                    })),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: _interestbuilder("Remaining Interest", "1088")),
                    Expanded(
                        child: _interestbuilder("Remaining Contact View", "1020")),
                    Expanded(
                        child: _interestbuilder("Remaining Gallery Image", "1071")),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child:
                      _walletbuilder("assets/images/83.png", "My Wallet",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>mywallet()));
                      }),
                    ),
                    Expanded(
                      child: _walletbuilder("assets/images/84.png", "Messages",(){
                      }),
                    ),
                    Expanded(
                      child: _walletbuilder(
                          "assets/images/85.png", "Notification",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Site()));
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _walletbuilder("assets/images/86.png", "My Interest",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyInterest()));
                      }),
                    ),
                    Expanded(child: _walletbuilder("assets/images/87.png", "My Prospect",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Prospect()));
                      }),
                    ),
                    Expanded(
                      child:
                      _walletbuilder("assets/images/88.png", "Block Users",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>IgnoredUser()));
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _walletbuilder(
                          "assets/images/89.png", "Happy Stories",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHappyStories()));
                      }),
                    ),
                    Expanded(
                      child: _walletbuilder("assets/images/90.png", "Blogs",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Blogs()));
                      }),
                    ),
                    Expanded(
                      child: _walletbuilder(
                          "assets/images/91.png", "Communications",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Communications()));
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _walletbuilder("assets/images/92.png", "Referral",(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRequestReceived()));
                      }),
                    ),
                    Expanded(
                      child: _walletbuilder(
                          "assets/images/93.png", "Refer & Earn",(){}),
                    ),
                    Expanded(
                      child: _walletbuilder(
                          "assets/images/87.png", "Refer Wallet",(){}),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffF2F2F2),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Package :",style: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),),
                                  SizedBox(height: 10),
                                  Text("Expire On :",style: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Professional Package",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "15.09.2024",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                         SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Package Details",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Color(0xffEE4B5F),fontFamily: "SFPRODISPLAYMEDIUM"),
                                ),
                              ),
                              Text(
                                "Package Purchase History",
                                style: TextStyle(color: Color(0xffEE4B5F),fontFamily: "SFPRODISPLAYMEDIUM"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumPlans()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffEE4B5F),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Upgrade Package",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),)
                    ],
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Matched Profile",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.18),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image:  DecorationImage(
                            image: AssetImage("assets/images/60.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olivia Emma',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '31 yrs, 5 feet, Never Married, Judaisamm, Israelites (Yisralim)',
                              maxLines: 3,
                              style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: "SFPRODISPLAYREGULAR"),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.18),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/60.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olivia Emma',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '31 yrs, 5 feet, Never Married, Judaisamm, Israelites (Yisralim)',
                              maxLines: 3,
                              style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: "SFPRODISPLAYREGULAR"),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            )
            )
          ],
        ),
      ),
    );
  }
  PopupMenuItem _buildPopupMenuItem(String imagePath, String text, VoidCallback onTap) {
    return PopupMenuItem(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              scale: 3,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text,style: TextStyle(fontFamily: "SFPRODISPLAYREGULAR"),),
          ],
        ),
      ),
    );
  }

  Widget _profilebulider(String name, VoidCallback function) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBED),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Color(0xFFEE4B5F), fontSize: 15),
        ),
      ),
    );
  }

  Widget _interestbuilder(String interestname, String count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          interestname,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(fontSize: 12,fontFamily: "SFPRODISPLAYREGULAR"),
        ),
        SizedBox(height: 5,),
        Text(
          count,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16,fontFamily: "SFPRODISPLAYMEDIUM"),
        ),
      ],
    );
  }

  Widget _walletbuilder(String image, name,VoidCallback function) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: function,
        child: Column(
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: primaryColor),
              child: Center(
                child: Image.asset(
                  image,
                  scale: 2.5,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 12,fontFamily: "SFPRODISPLAYREGULAR"),
            )
          ],
        ),
      ),
    );
  }
}
