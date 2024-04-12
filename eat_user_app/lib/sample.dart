/*
import 'package:eat_user_app/constant.dart';
import 'package:flutter/material.dart';
class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  var currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    MiddleWare middleWare = MiddleWare();
    Size size = MediaQuery.of(context).size;
    List _widgetOptions = [
      HomePage(),
      OrderHistory(""),
      HomePage(),
      PartyOrderPage(),
      ProfilePage(),
    ];
    List<String> listOfImagePaths = [
      'assets/images/reels.png'
          'assets/images/orderprocessed.png',
      'assets/images/home.png',
      'assets/images/order.png',
      'assets/images/profile.png',
    ];
    List<String> listOfImagePathsSelected = [
      'assets/images/reels.png'
          'assets/images/orderprocessed.png',
      'assets/images/home.png',
      'assets/images/order.png',
      'assets/images/profile.png',
    ];
    List<String> listOfNames = ['Reels', 'Products', 'Home', 'Party Order', 'Order'];

    return WillPopScope(
      onWillPop: () async {
        onBackPressed(); // Action to perform on back pressed
        return false;
      },
      child: Scaffold(
        body: _widgetOptions[currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: size.width * .135,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .110,
                    height: index == currentIndex ? size.width * .010 : 0,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Image.asset(
                    index == currentIndex
                        ? listOfImagePaths[index]:listOfImagePathsSelected[index],
                    height: size.width * .051,
                    width: size.width * .051,
                    color: index == currentIndex ? kPrimaryColor : Colors.black,
                  ),
                  Text(
                    listOfNames[index],
                    style: TextStyle(
                      color: index == currentIndex ? kPrimaryColor : Colors.black,
                      fontWeight: index == currentIndex
                          ? FontWeight.w700
                          : FontWeight.w400,
                      fontSize: index == currentIndex ? 13 : 12,
                    ),
                  ),
                  SizedBox(height: size.width * .01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  onBackPressed(){
    showAlertDialog(context);
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Exit"),
      onPressed:  () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Eat"),
      content: const Text("Would you like to want to exit?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
*/
