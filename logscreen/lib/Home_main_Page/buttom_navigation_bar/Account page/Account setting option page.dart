import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logscreen/Home_main_Page/buttom_navigation_bar/Account%20page/profile%20page%20setting.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF2ecc71);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFf5f6fb),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: const Color(0xFFf5f6fb),
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  height: size.height * 0.26,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.7),
                    border: Border.all(
                        color: Colors.black,
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 33,
                              backgroundColor: Colors.grey,
                              child: Text(
                                "JR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Abishek JR ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      /*Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Get Your Membership",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    const Text("Free delivery on all orders",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: size.height*0.04,
                                          width: size.width*0.30,
                                          child: TextButton(onPressed: (){}, child: const Text("Get started",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),)),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(10)
                                          ) ,),
                                      ],

                                    ),

                                  ],
                                ),
                              ],
                            ),const Positioned(
                                top: 100,
                                right: 20,
                                child: Image(image: AssetImage("assets/images/member.png"),height: 80,width: 80,))],
                        ),
                      ),*/
                      Container()
                    ],
                  ),

                ),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.18,
                      child: InkWell(child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.heart,),
                          Text("Favourite",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
                        ],
                      ),onTap: (){},),

                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),),
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.18,
                      child: InkWell(child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.cart),
                          Text("Your Order",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,),)
                        ],
                      ),onTap: (){},),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),

                      ),

                    ),
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.18,
                      child: InkWell(child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.settings,size: 25,),
                          Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
                        ],
                      ),onTap: (){},),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),


                    ),
                  ],
                ),SizedBox(
                  height: size.height*0.009,
                  width: size.width,
                ),
                profilesettings(leadingIcon: Icons.subscriptions_outlined, trailingIcon: Icons.arrow_forward, title: 'Subscrition', onTap: () {  },),
                profilesettings(leadingIcon: CupertinoIcons.person, trailingIcon: Icons.arrow_forward, title: 'Personal Details', onTap: () {  },),
                profilesettings(leadingIcon: CupertinoIcons.location, trailingIcon: Icons.arrow_forward, title: ' My Address', onTap: () {  },),
                profilesettings(leadingIcon: Icons.help_outline_sharp, trailingIcon: Icons.arrow_forward, title: 'Help', onTap: () {  },),
                profilesettings(leadingIcon: Icons.logout_outlined, trailingIcon: Icons.arrow_forward, title:'Log Out', onTap: () {  }, ),
                SizedBox(
                  height: size.height*0.01,
                  width: size.width,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Follow Us on :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/instagram.jpeg',height:size.height*0.070,width: size.width*0.070,),
                      SizedBox(width: size.width*0.040,),
                      Image.asset('assets/images/facebook.jpeg',height:size.height*0.070,width: size.width*0.070,),
                      SizedBox(width: size.width*0.040,),
                      Image.asset('assets/images/twitter.png',height:size.height*0.070,width: size.width*0.070,),
                      SizedBox(width: size.width*0.040,),
                      Image.asset('assets/images/web.jpeg',height:size.height*0.070,width: size.width*0.070,),

                    ],
                  ),
                )

              ],
            ),
          ),

        ),
      ),
    );
  }
}

