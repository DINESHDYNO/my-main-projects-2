import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant.dart';
import 'LoginScreen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> splashTexts = [
    "Order And Enjoy Delicious Food at Home With Your Favourite Ones",
    "From My Kitchen to Yours, Enjoy the Feast",
    "Nothing Beats a Homemade Meal",
  ];

  final List<String> next = [
    'Next',
    'Next',
    'Get Started',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Exit"),
      onPressed:  () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Eat"),
      content: Text("Would you like to want to exit?"),
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
  onBackPressed(){
    showAlertDialog(context);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        onBackPressed();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.5,
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        children: [
                          SplashImage(image: "assets/images/Frame1.png"),
                          SplashImage(image: "assets/images/Frame2.png"),
                          SplashImage(image: "assets/images/Frame3.png"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        splashTexts[currentPage],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                            (index) => dotContainer(index: index),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minWidth: double.infinity,
                        height: 50,
                        color: kPrimaryColor,
                        onPressed: () {
                          setState(() {
                            if (currentPage < 2) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          next[currentPage],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dotContainer({int? index}) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kPrimaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class SplashImage extends StatelessWidget {
  const SplashImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
