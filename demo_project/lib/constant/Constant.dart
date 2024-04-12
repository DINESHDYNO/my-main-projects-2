
// import 'package:flutter/material.dart';
//
// class MyTheme {
//   MyTheme._();
//   static Color kPrimaryColor = const Color(0xff7C7B9B);
//   static Color kPrimaryColorVariant = const Color(0xff686795);
//   static Color kAccentColor = const Color(0xffFCAAAB);
//   static Color kAccentColorVariant = const Color(0xffF7A3A2);
//   static Color kUnreadChatBG = const Color(0xffEE1D1D);
//
//   static final TextStyle kAppTitle = GoogleFonts.grandHotel(fontSize: 36);
//
//   static final TextStyle heading2 = const TextStyle(
//     color: Color(0xff686795),
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     letterSpacing: 1.5,
//   );
//
//   static final TextStyle chatSenderName = const TextStyle(
//     color: Colors.white,
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//     letterSpacing: 1.5,
//   );
//
//   static final TextStyle bodyText1 = const TextStyle(
//       color: Color(0xffAEABC9),
//       fontSize: 14,
//       letterSpacing: 1.2,
//       fontWeight: FontWeight.w500);
//
//   static final TextStyle bodyTextMessage =
//   const TextStyle(fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.w600);
//
//   static final TextStyle bodyTextTime = const TextStyle(
//     color: Color(0xffAEABC9),
//     fontSize: 11,
//     fontWeight: FontWeight.bold,
//     letterSpacing: 1,
//   );
// }

import 'package:flutter/material.dart';

const String imagePath= "assets/images/";

const Color? primaryColor = const Color(0xFFED2E47);
const Color? whiteColor = Colors.white;
const Color? blackColor = Colors.black;
const Color? greyColor = const Color(0xffEFEFEF);
const Color? redColor = const Color(0xFFFF0000);
const Color? orangeColor = const Color(0xFFFFA500);
const Color? greenColor = const Color(0xFF006400);
const Color? scaffoldBgColor = const Color(0xFFF2F4F6);


// class HexColor extends Color {
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
//
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//     if (hexColor.length == 6) {
//       hexColor = 'FF' + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
// }

const double fixPadding = 10.0;

const SizedBox heightSpace = const SizedBox(height: 10.0);

const SizedBox height5Space = const SizedBox(height: 5.0);

const SizedBox height20Space = const SizedBox(height: 20.0);

const SizedBox widthSpace = const SizedBox(width: 10.0);

const SizedBox width5Space = const SizedBox(width: 5.0);

const SizedBox width20Space = const SizedBox(width: 20.0);

const TextStyle appBarTextStyle = const TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: blackColor,
);

const TextStyle appBarWhiteTextStyle = const TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: whiteColor,
);

const TextStyle black12RegularTextStyle = const TextStyle(
  fontSize: 12.0,
  color: blackColor,
);

const TextStyle black14RegularTextStyle = const TextStyle(
  fontSize: 14.0,
  color: blackColor,
);

const TextStyle black14BoldTextStyle = const TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontWeight: FontWeight.bold,
);
const TextStyle pink15RegularTextStyle = const TextStyle(
  fontSize: 15.0,
  color: primaryColor,
  fontFamily: "SFPRODISPLAYMEDIUM"
);

const TextStyle black15BoldTextStyle = const TextStyle(
  fontSize: 15.0,
  color: blackColor,
  fontWeight: FontWeight.bold,
);

const TextStyle black12MediumTextStyle = const TextStyle(
  fontSize: 12.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

const TextStyle black14MediumTextStyle = const TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

const TextStyle black16MediumTextStyle = const TextStyle(
  fontSize: 16.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

const TextStyle black18MediumTextStyle = const TextStyle(
  fontSize: 18.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

const TextStyle black16SemiBoldTextStyle = const TextStyle(
  fontSize: 16.0,
  color: blackColor,
  fontWeight: FontWeight.w600,
);

const TextStyle black16BoldTextStyle = const TextStyle(
  fontSize: 16.0,
  color: blackColor,
  fontWeight: FontWeight.bold,
);

const TextStyle black18BoldTextStyle = const TextStyle(
  fontSize: 18.0,
  color: blackColor,
  fontWeight: FontWeight.bold,
);

const TextStyle white12MediumTextStyle = const TextStyle(
  fontSize: 12.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

const TextStyle white14MediumTextStyle = const TextStyle(
  fontSize: 14.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

const TextStyle white16MediumTextStyle = const TextStyle(
  fontSize: 16.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

const TextStyle white18MediumTextStyle = const TextStyle(
  fontSize: 18.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

const TextStyle white48MediumTextStyle = const TextStyle(
  fontSize: 48.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

const TextStyle white12SemiBoldTextStyle = const TextStyle(
  fontSize: 12.0,
  color: whiteColor,
  fontWeight: FontWeight.w600,
);

const TextStyle white14BoldTextStyle = const TextStyle(
  fontSize: 14.0,
  color: whiteColor,
  fontWeight: FontWeight.bold,
);

const TextStyle white18BoldTextStyle = const TextStyle(
  fontSize: 18.0,
  color: whiteColor,
  fontWeight: FontWeight.bold,
);

const TextStyle white36BoldTextStyle = const TextStyle(
  fontSize: 36.0,
  color: whiteColor,
  fontWeight: FontWeight.bold,
);

const TextStyle primaryColor12RegularTextStyle = const TextStyle(
  fontSize: 12.0,
  color: primaryColor,
);

const TextStyle primaryColor14RegularTextStyle = const TextStyle(
  fontSize: 14.0,
  color: primaryColor,
);

const TextStyle primaryColor14MediumTextStyle = const TextStyle(
  fontSize: 14.0,
  color: primaryColor,
  fontWeight: FontWeight.w500,
);

const TextStyle primaryColor16MediumTextStyle = const TextStyle(
  fontSize: 16.0,
  color: primaryColor,
  fontWeight: FontWeight.w500,
);

const TextStyle primaryColor16BoldTextStyle = const TextStyle(
  fontSize: 16.0,
  color: primaryColor,
  fontWeight: FontWeight.bold,
);

const TextStyle primaryColor18BoldTextStyle = const TextStyle(
  fontSize: 18.0,
  color: primaryColor,
  fontWeight: FontWeight.bold,
);

const TextStyle primaryColor22BoldTextStyle = const TextStyle(
  fontSize: 22.0,
  color: primaryColor,
  fontWeight: FontWeight.bold,
);

const TextStyle grey12RegularTextStyle = const TextStyle(
  fontSize: 12.0,
  color: greyColor,
);

const TextStyle grey14RegularTextStyle = const TextStyle(
  fontSize: 14.0,
  color: greyColor,
);

const TextStyle grey12MediumTextStyle = const TextStyle(
  fontSize: 12.0,
  color: greyColor,
  fontWeight: FontWeight.w500,
);

const TextStyle grey12MediumItalicTextStyle = const TextStyle(
  fontSize: 14.0,
  color: greyColor,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);

const TextStyle grey14MediumTextStyle = const TextStyle(
  fontSize: 14.0,
  color: greyColor,
  fontWeight: FontWeight.w500,
);

const TextStyle grey16MediumTextStyle = const TextStyle(
  fontSize: 16.0,
  color: greyColor,
  fontWeight: FontWeight.w500,
);

const TextStyle grey12BoldTextStyle = const TextStyle(
  fontSize: 12.0,
  color: greyColor,
  fontWeight: FontWeight.bold,
);

const TextStyle grey14BoldTextStyle = const TextStyle(
  fontSize: 14.0,
  color: greyColor,
  fontWeight: FontWeight.bold,
);

const TextStyle grey16BoldTextStyle = const TextStyle(
  fontSize: 16.0,
  color: greyColor,
  fontWeight: FontWeight.bold,
);

const TextStyle grey18BoldTextStyle = const TextStyle(
  fontSize: 18.0,
  color: greyColor,
  fontWeight: FontWeight.bold,
);

const TextStyle grey20BoldTextStyle = const TextStyle(
  fontSize: 20.0,
  color: greyColor,
  fontWeight: FontWeight.bold,
);

const TextStyle green14MediumTextStyle = const TextStyle(
  fontSize: 14.0,
  color: greenColor,
  fontWeight: FontWeight.w500,
);

const TextStyle red14MediumTextStyle = const TextStyle(
  fontSize: 14.0,
  color: redColor,
  fontWeight: FontWeight.w500,
);
