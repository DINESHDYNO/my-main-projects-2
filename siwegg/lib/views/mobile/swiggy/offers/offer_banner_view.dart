import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../utils/ui_helper.dart';
import '../../../../widgets/responsive.dart';
import '../groceries/grocery_screen.dart';

class OfferBannerView extends StatefulWidget {

  OfferBannerView({Key? key}) : super(key: key);

  @override
  State<OfferBannerView> createState() => _OfferBannerViewState();
}

class _OfferBannerViewState extends State<OfferBannerView> {
  int currentImageIndex=0;

  final List<String> images = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    return Column(
      children: [
        InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: isTabletDesktop ? 260.0 : 180.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(isTabletDesktop ? 13.0 : 10.0),
            ),
            child: Swiper(
              itemHeight: 100,
              duration: 500,
              itemWidth: double.infinity,
              itemCount: images.length,
              onIndexChanged: (int index) {
                setState(() {
                  currentImageIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius: BorderRadius.circular(isTabletDesktop ? 13.0 : 10.0),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
              autoplay: true,
              viewportFraction: 1.0,
              scale: 0.9,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GroceryScreen(),
              ),
            );
          },
        ),
        UIHelper.verticalSpaceSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((MapEntry<int, String> entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 2.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentImageIndex == index
                    ? Colors.deepOrange
                    : Colors.grey[300],
              ),
            );
          }).toList(),
        ),
        UIHelper.verticalSpaceMedium(),
      ],
    );
  }
}
