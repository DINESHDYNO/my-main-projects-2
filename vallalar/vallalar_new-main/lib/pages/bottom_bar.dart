import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urban_home/constant/constant.dart';
import 'package:urban_home/pages/screens.dart';
import 'package:urban_home/pages/services/Bookmarkpage.dart';
import 'package:urban_home/pages/services/Searchpage.dart';

class BottomBar extends StatefulWidget {
  final int? index;

  const BottomBar({Key? key, this.index}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  DateTime? currentBackPressTime;
  int? currentIndex;
  @override
  void initState() {
    super.initState();

    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index;
      });
    } else {
      setState(() {
        currentIndex = 1;
      });
    }
  }

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 0,
        child: Container(
          height: (Platform.isAndroid) ? 75.0 : 75.0,
          width: double.infinity,
          color: Color(0xfffff0c1),
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomBarItem('assets/homeicon.png', 'முகப்பு', 1),
              bottomBarItem('assets/serachicon.png', 'தேடல்', 2),
              bottomBarItem('assets/saveicon.png', 'புத்தக்குறி', 3),
              bottomBarItem('assets/menuicon.png', 'பட்டியல்', 4),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        child: (currentIndex == 1)
            ? HomePage()
            : (currentIndex == 2)
                ? SearchPage()
                : (currentIndex == 3)
                    ? BookMarkPage()
                    : (currentIndex == 4)
                        ? UrbanHomeCash()
                         : Profile(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  Widget bottomBarItem(imagePath, title, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 4,),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 3,bottom: 3),
          decoration: BoxDecoration(color: (index == currentIndex) ? Color(0xfffabc13) : Colors.transparent,
            borderRadius: BorderRadius.circular(30)
          ),
          child: IconButton(
            padding :EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 22, maxWidth: 22),
            icon: Image.asset(
              imagePath,
              width: 22.0,
              height: 22.0,
            ),
            onPressed: () => changeIndex(index),
          ),
        ),
        SizedBox(height: 4,),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Montserrat',
            fontSize: 12.0,
            color: Colors.black,
            fontWeight: FontWeight.w600
            // color: (index == currentIndex) ? primaryColor : greyColor,
          ),
        ),
        SizedBox(height: 4,),
      ],
    );
  }
}
