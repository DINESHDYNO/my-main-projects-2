import 'dart:math';

import 'package:flutter/material.dart';

import '../constant/Constant.dart';
import '../member_page_screens/Full_Profile.dart';
import '../member_page_screens/SearchPage.dart';
import '../profile_page_screens/profile_settings_screens/Notification.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  final PageController _pageController = PageController();
  final List<String> imagePaths = [
    "assets/images/63.png",
    "assets/images/64.png",
    "assets/images/52.png",
    "assets/images/53.png",
    "assets/images/54.png",
    "assets/images/55.png",
    "assets/images/56.png",
    "assets/images/57.png",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9F0),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: Image.asset('assets/images/16.png'),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _displayBottomSheet(context);
                          },
                          child: Image.asset('assets/images/20.png', scale: 3),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Site()));
                            },
                            child: Image.asset('assets/images/17.png', scale: 3)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 582,
                width: size.width,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: imagePaths.length,
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (BuildContext context,index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 5,
                          left: 5,
                          right: 5,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children:  [
                                                  Text(
                                                    'Ramya Kishnan',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Image.asset('assets/images/23.png', scale: 3),
                                                ],
                                              ),
                                            ),
                                            const Icon(Icons.more_vert, color: Colors.white),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          'Member ID : AE12345',
                                          style: TextStyle(color: Colors.white, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM"),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/images/18.png", scale: 3.5),
                                          const SizedBox(width: 5),
                                          const Text(
                                            '23 yrs,5 Ft',
                                            style: TextStyle(color: Colors.white, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM"),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset("assets/images/19.png", scale: 3.5),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Chennai',
                                                style: TextStyle(color: Colors.white, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  FullProfilePage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        side: const BorderSide(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      elevation: 0,
                                      primary: Colors.black38,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      child: Text('Full Profile', style: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(3, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: (){
                        setState(() {
                            if (currentIndex > 0) {
                              _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                            }
                        });
                      },
                      child: Container(
                        height: size.height*0.04,
                        decoration: BoxDecoration(
                          color: const Color(0xFFf0f0f0),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset('assets/images/21.png', scale: 4),
                      ),
                    ),
                    trailing: GestureDetector(
                     onTap: (){
                       setState(() {
                         if (currentIndex < imagePaths.length - 1) {
                           _pageController.nextPage(
                             duration: const Duration(milliseconds: 500),
                             curve: Curves.ease,
                           );
                         }
                       });
                     },
                      child: Container(
                        height: size.height*0.04,
                        decoration: BoxDecoration(
                          color: const Color(0xFFf0f0f0),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset('assets/images/22.png', scale: 4),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height*0.04,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset('assets/images/24.png', scale: 3),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: size.height*0.04,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset('assets/images/25.png', scale: 3),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: size.height*0.04,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset('assets/images/26.png', scale: 3),
                        ),
                      ],
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

  Future<void> _displayBottomSheet(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    await showModalBottomSheet(
      barrierColor: Colors.black54,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/34.png", scale: 2.2),
                  const Text('Search', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Age From', style: TextStyle(color: primaryColor, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM")),
                              const SizedBox(height: 10),
                              Container(
                                height: 60,
                                width: size.width / 2.5,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: ListTile(
                                    title: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter Age",
                                        hintStyle: TextStyle(color: Colors.grey,fontFamily: "SFPRODISPLAYMEDIUM"),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('To', style: TextStyle(color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM")),
                            const SizedBox(height: 10),
                            Container(
                              height: 60,
                              width: size.width / 2.5,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: ListTile(
                                  title: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Enter Age",
                                      hintStyle: TextStyle(color: Colors.grey,fontFamily: "SFPRODISPLAYMEDIUM"),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  buildExpansionTile('Religion'),
                  buildExpansionTile('Mother Tongue'),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minWidth: double.infinity,
                      height: 50,
                      color: primaryColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                      },
                      child: const Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(child: Text("Switch to Advanced Search", style: TextStyle(fontSize: 16, color: primaryColor))),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildExpansionTile(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey.shade200,
              trailing: const Icon(Icons.arrow_drop_down),
              title: Text('Select', style: TextStyle(color: Colors.grey[700],fontFamily: "SFPRODISPLAYMEDIUM")),
            ),
          ),
        ),
      ],
    );
  }
}
