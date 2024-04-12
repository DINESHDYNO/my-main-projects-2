import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';

import '../member_page_screens/SearchPage.dart';
import '../profile_page_screens/profile_settings_screens/Notification.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    List<String>images=[
      'assets/images/64.png',
      'assets/images/63.png',
      'assets/images/60.png',
    ];
    List<String>images1=[
      'assets/images/66.png',
      'assets/images/67.png',
      'assets/images/66.png',
    ];
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 180,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/images/61.png'),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Text('Choose Life Partner From Your Own Community.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text('Kalyanam Matrimonial Is No.1 Tamil Matrimonial Site In Tamilnadu.',style: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: "SFPRODISPLAYMEDIUM"),),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text('Primium Members',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.black),),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 196.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Poonmalar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Member ID: AE232322',
                                  style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 13,
                                      fontFamily: "SFPRODISPLAYMEDIUM"
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 156,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/62.png"),fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Text('Recently Joined',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.black),),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 196,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Poonmalar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Member ID: AE232322',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13
                                      ,fontFamily: "SFPRODISPLAYMEDIUM"
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Happy Stroies',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.black),),
                    Text('See All',style: TextStyle(fontSize: 15,color: primaryColor),),
                  ],
                ),
              ),
              Container(
                height: 212,
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/65.png"),fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tips To Build Amicable Relationship With In-Laws',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'With ever-evolving technologies, finding love online has seen greater acceptance in modern societies...',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color:Color(0xB3FFFFFF),
                        fontSize: 12
                          ,fontFamily: "SFPRODISPLAYMEDIUM"
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => dotContainer(index: index),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Blog',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.black),),
                    Text('See All',style: TextStyle(fontSize: 16,color: Colors.pink),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Color(0xffFFF9F0),
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: List.generate(images1.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 124,
                              width: 190,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(images1[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " Five Fun Things Every Couple Should Do After Marriage",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset("assets/images/15.png", scale: 3),
                              const SizedBox(width: 5),
                              const Text(
                                "26 January 2024",
                                style: TextStyle(fontSize: 10, color: Color(0xFF8D8D8D)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
  Container dotContainer({int? index}) {
    int currentPage=0;
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
