import 'package:flutter/material.dart';
import '../constant/Constant.dart';
import '../main_screens/Chat.dart';
import '../main_screens/Explore.dart';
import '../main_screens/Member.dart';
import '../main_screens/Profile.dart';

class HomeBottomNavigationScreen extends StatefulWidget {
  const HomeBottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationScreenState createState() =>
      _HomeBottomNavigationScreenState();
}

class _HomeBottomNavigationScreenState
    extends State<HomeBottomNavigationScreen> {
  final List<Widget> _children = [
    const MemberPage(),
    const ExplorePage(),
     ChatPage(),
    const ProfilePage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectTextStyle = Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14.0,fontWeight: FontWeight.w600);
    final unselectTextStyle = Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14.0,fontFamily: "SFPRODISPLAYMEDIUM");
    return Scaffold(
      body: _children[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 75.0,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor:const Color(0xff8D8D8D),
          currentIndex: selectedIndex,
          selectedLabelStyle: selectTextStyle,
          unselectedLabelStyle: unselectTextStyle,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items:  [
              _bottomNavigationBar("Members", "assets/images/27.png", 0),
              _bottomNavigationBar("Explore", "assets/images/28.png", 1),
              _bottomNavigationBar("Chat", "assets/images/29.png", 2),
              _bottomNavigationBar("Profile", "assets/images/30.png", 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBar(lable,image,index){
    return  BottomNavigationBarItem(
      icon: Image.asset(image,color: selectedIndex==index?primaryColor:const Color(0xff8D8D8D),scale: 3,),
      label: lable,
    );
  }
}


