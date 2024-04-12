import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:urban_home/pages/screens.dart';
import 'package:urban_home/pages/services/Bookmarkpage.dart';
import '../../ApiServices/api_fetch_data.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return SafeArea(
      child:postModel.loading
          ? Center(child: CircularProgressIndicator(color:Color(0xfffabc13)))
          : Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
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
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.only(right: 23, left: 23),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                          child: Text(
                            "வகை",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              // color: (index == currentIndex) ? primaryColor : greyColor,
                            ),
                          )
                      )
                  ),
                ),
                  Positioned(
                    top: 17,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: Image.asset(
                              'assets/sidemenu.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
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
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  await postModel.getPostData();
                },
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: postModel.post?.categories?.length,
                    itemBuilder: (context, index) {
                      var category = postModel.post?.categories?[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, top: 0, bottom: 15),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ServiceList(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.only(
                                    left: 18,
                                    right: 10,
                                    top: 10,
                                    bottom: 10
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: CircleBorder(),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(500),
                                                child: CachedNetworkImage(
                                                  imageUrl: category?.thumbnail ?? '',
                                                  fit: BoxFit.cover,
                                                  height: 300,
                                                  width: 300,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(category?.thumbnail??''),
                                            fit: BoxFit.cover
                                          )
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: Text(
                                        category?.name ?? '',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: Color(0xfffabc13),
                                          borderRadius:
                                          BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text(
                                            category?.mediaCount ?? "",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ) /* Center(child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,)),*/
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
        drawer: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Drawer(
            backgroundColor: Colors.white,
            child: Center(
              child: ListView(
                padding: EdgeInsets.zero,
                // shrinkWrap: true,
                // physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/menubg.png',
                            width: 225,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 30,
                            bottom: 0,
                            child: Image.asset(
                              'assets/logo.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: BottomBar(),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 40, bottom: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/homeicon.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "முகப்பு பக்கம்",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              // color: (index == currentIndex) ? primaryColor : greyColor,
                            ),
                          ),
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
                          child: BookMarkPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 40, bottom: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/saveicon.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "புத்தக்குறி",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              // color: (index == currentIndex) ? primaryColor : greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/shareicon.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "பகிர்",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/emptyicon.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "பின்னூட்டம்",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/settingsicon.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "அமைப்புகள்",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            // color: (index == currentIndex) ? primaryColor : greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/messageicon.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "தொடர்பு",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            // color: (index == currentIndex) ? primaryColor : greyColor,
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
    ));
  }
}
