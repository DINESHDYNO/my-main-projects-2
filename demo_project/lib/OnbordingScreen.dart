import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';

import 'login_and_register/LoginPage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  final List<String> splashHeadline = [
    'Meet Your Perfect Match',
    'Viewed Profile',
    'Meet Your Perfect Match',
  ];
  final List<String> splashTexts = [
    "Please read our privacy policy and policy regarding before register",
    "Please read our privacy policy and policy regarding before register",
    "Please read our privacy policy and policy regarding before register",
  ];
  final List<String> next = [
    'Next',
    'Next',
    'Get Started',
  ];
  final List<String> skip = [
    'Skip',
    'Skip',
    ''
  ];
  final List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/4.png",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFFEFF0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.5,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => SplashImage(image: images[index]),
              ),
            ),
             SizedBox(height: 40),
            _buildContentContainer(size),
             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildContentContainer(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(3, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
           SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
                  (index) => dotContainer(index: index),
            ),
          ),
           SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              splashHeadline[currentPage],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              splashTexts[currentPage],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff8D8D8D),
                fontFamily: "SFPRODISPLAYMEDIUM"
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              minWidth: double.infinity,
              height: 50,
              color: primaryColor,
              onPressed: () {
                setState(() {
                  if (currentPage < images.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                });
              },
              child: Text(
                next[currentPage],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            skip[currentPage],
            style: const TextStyle(
              color: primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Container dotContainer({required int index}) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? primaryColor
            : Colors.grey.withOpacity(0.5),
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
