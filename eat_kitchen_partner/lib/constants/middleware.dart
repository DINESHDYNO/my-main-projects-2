import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiddleWare {
  static final MiddleWare _middleWare = MiddleWare._internal();

  factory MiddleWare() {
    return _middleWare;
  }
  double minimumPadding = 5.0;
  MiddleWare._internal();
  Color uiIconColor = Color(0xff006838);
  Color uiThemeColor = Color(0xff0e360c);
  bool isApiLoading = false;

  String strRupeeCurrency = "\u20B9";

  String strDollarCurrency = "\$";

  var placeholder = AssetImage('assets/images/launcher_icon.png');
  var placeHolderPath = "assets/images/launcher_icon.png";
  String status = "0";
  bool isFirstToast = false;

  int compressImage = 30;

  String strOfflineMsg = "You are offline. Check your connection!!!";
  String strSorrySomethingWentWrong = "Sorry, something went wrong";
  String strLoadingPleaseWait = "Loading,Please Wait...";

  getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  //check string format
  String validString(String strText) {
    try {
      if (strText == null || strText.trim().isEmpty)
        return "";
      else
        return strText.trim();
    } catch (e) {
      print(e);
    }
    return "";
  }

  //custom textStyle
  TextStyle customTextStyle(double fontSize, Color textColor, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'Roboto', // Use the font family name specified in pubspec.yaml
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  TextStyle customTextStyleLineThrough(double fontSize, Color textColor, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'Roboto',
      decoration: TextDecoration.lineThrough,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  TextStyle customLinkTextStyle(double fontSize, Color textColor, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'Roboto',
      decoration: TextDecoration.underline,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }
 /* TextStyle customTextStyle(
      double fontSize, Color textColor, FontWeight fontWeight) {

    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: fontSize, color: textColor, fontWeight: fontWeight));
  }

  TextStyle customTextStyleLineThrough(
      double fontSize, Color textColor, FontWeight fontWeight) {

    return GoogleFonts.poppins(
        textStyle: TextStyle(decoration: TextDecoration.lineThrough,
            fontSize: fontSize, color: textColor, fontWeight: fontWeight));
  }

  // custom underlineTextStyle
  TextStyle customLinkTextStyle(
      double fontSize, Color textColor, FontWeight fontWeight) {

    return GoogleFonts.poppins(
        textStyle: TextStyle(decoration: TextDecoration.underline,
            fontSize: fontSize, color: textColor, fontWeight: fontWeight));
  }*/

  //custom divider with height
  SizedBox putSizedBoxHeight(double value) {
    return SizedBox(
      height: value,
    );
  }
  //divider with color
  Divider putDivider(double value, Color lineColor) {
    return Divider(height: value, color: lineColor);
  }

  // getAppBar(BuildContext context){
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.only(top: 10),
  //     child:Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
  //       Expanded(flex:1,child:  Container(
  //         width: MediaQuery.of(context).size.width * 0.25,
  //         height: 30,
  //         child:FlutterSwitch(
  //           activeText: "Online",
  //           inactiveText: "Offline",
  //           activeColor: uiAlphaColor,
  //           inactiveColor: Colors.red ,
  //           activeTextColor: uiWhiteColor,
  //           inactiveTextColor: uiWhiteColor,
  //           activeTextFontWeight: FontWeight.w600,
  //           value: status,
  //           valueFontSize: 14.0,
  //           width: 90,
  //           // height: 30,
  //           borderRadius: 30.0,
  //           showOnOff: true,
  //           onToggle: (val) {
  //             // setState(() {
  //               // isSwitchOn = val;
  //               status = val;
  //             // });
  //           },
  //         ),
  //       )),
  //       Expanded(flex:1,child:  Container(
  //         width: MediaQuery.of(context).size.width * 0.50,
  //         child:Image.asset("assets/images/homescreen_title_one.png",height: 50,),
  //       )) ,
  //       Expanded(flex: 1,child:Container(
  //           width: MediaQuery.of(context).size.width * 0.25,
  //           child:Row(mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               IconButton(
  //                 icon: Icon(Icons.notifications,color: uiAlphaColor),
  //
  //                 onPressed: () {
  //                   showModalBottomSheet(
  //                     context: context,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.vertical(
  //                         top: Radius.circular(15), // Adjust this value for the curvature
  //                       ),
  //                     ),
  //                     backgroundColor: uiAlphaColor,
  //                     builder: (BuildContext context) {
  //                       return FractionallySizedBox(
  //                         heightFactor: 0.3, // Adjust this value to control the height (40% in this case)
  //                         child: BottomSheetWidget(context),
  //                       );// Custom widget for the bottom sheet content
  //                     },
  //                   );
  //                   // Handle search action
  //                 },),
  //               IconButton(
  //                 icon: Icon(Icons.search,color: uiAlphaColor,),
  //
  //                 onPressed: () {
  //                   // setState(() {
  //                   //   cardVal = true;
  //                   // });
  //                 },),
  //             ],
  //           )
  //       )
  //
  //       ),]
  //     ),);
  // }
  changeKitchenStatus(String sts){
    status = sts;
  }

  //hideKeyBoard function
  void hideKeyBoard(BuildContext context) {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {
      print(e);
    }
  }
  showLog(message) {
    print("AEL: " + message);
  }

  //custom divider with width
  SizedBox putSizedBoxWidth(double value) {
    return SizedBox(
      width: value,
    );
  }

}
