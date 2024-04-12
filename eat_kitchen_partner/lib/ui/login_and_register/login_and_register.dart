import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/app_colors.dart';
import '../../constants/middleware.dart';
import '../../constants/strings_constants.dart';
import 'login/mobileverifictaion.dart';
import 'register/register_mobileverify.dart';

class LandingPageBase extends StatefulWidget {
  const LandingPageBase({super.key});

  @override
  _LandingPageBaseState createState() => _LandingPageBaseState();
}

 class _LandingPageBaseState extends State<LandingPageBase> with WidgetsBindingObserver {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  MiddleWare middleWare = MiddleWare();
  final List<String> sliderList = [
    landing_page_description,
    landing_page_two_description,
    landing_page_three_description,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildSlider(),
          _buildBottomContent(),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: const [
              LandingPage(imagePath: "assets/images/landing_bg_one.jpg"),
              LandingPage(imagePath: "assets/images/landing_bg_two.jpg"),
              LandingPage(imagePath: "assets/images/landing_bg_three.jpg"),
            ],
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderList
                .asMap()
                .entries
                .map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : uiLightGreyColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/eat_icon.png', width: 100, height: 50,),
                  Text(
                    restaurantPartner,
                    style: middleWare.customTextStyle(13, Colors.white, FontWeight.bold),
                  ),
                  middleWare.putSizedBoxHeight(10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      _current == 0
                          ? landing_page_description
                          : _current == 1
                          ? landing_page_two_description
                          : _current == 2
                          ? landing_page_three_description
                          : landing_page_description,
                      style: middleWare.customTextStyle(17, Colors.white, FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  middleWare.putSizedBoxHeight(10),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: sliderList
                .asMap()
                .entries
                .map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : uiLightGreyColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          height: 200,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: getLoginBtn()),
                Container(child: getRegisterBtn())
              ],
            ),
          ),
        ),
      ],
    );
  }
  Container getLoginBtn() {
    return Container(
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 4,
        // bottom: middleWare.minimumPadding * 5,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: uiAlphaColor,
          foregroundColor: uiAlphaColor,
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding * 3,
            bottom: middleWare.minimumPadding * 3,
            left: middleWare.minimumPadding * 7,
            right: middleWare.minimumPadding * 7,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(login, style: middleWare.customTextStyle(18.00, Colors.white, FontWeight.normal)),
            const SizedBox(width: 8,),
          ],
        ),
        onPressed: ()  {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MobileVerificationPage()));
        },
      ),
    );
  }
  Container getRegisterBtn() {
    return Container(
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 4,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: uiAlphaColor),
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding * 3,
            bottom: middleWare.minimumPadding * 3,
            left: middleWare.minimumPadding * 7,
            right: middleWare.minimumPadding * 7,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(register, style: middleWare.customTextStyle(18.00, uiAlphaColor, FontWeight.normal)),
            const SizedBox(width: 8,),
          ],
        ),
        onPressed: ()  async {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterMobileVerifyPage()));
        },
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  final String imagePath;

  const LandingPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
