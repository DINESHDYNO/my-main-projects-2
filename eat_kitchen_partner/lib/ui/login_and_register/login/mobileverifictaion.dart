import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/middleware.dart';
import '../../../constants/strings_constants.dart';

class MobileVerificationPage extends StatefulWidget {
  const MobileVerificationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobileVerificationState();
  }
}

class MobileVerificationState extends State<MobileVerificationPage> {
  MiddleWare middleWare = MiddleWare();
  TextEditingController mobileController = TextEditingController();
  final _mobileKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Frame2.png",
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    mobileNumberVerificationMsg,
                    style: middleWare.customTextStyle(
                        15, uiBetaColor, FontWeight.bold),
                  ),
                ),
                middleWare.putSizedBoxHeight(20),
                Form(
                    key: _mobileKey,
                    child: Container(child: getMobileNumberController())),
                getOtpBtn()
              ],
            ),
          )),
        ],
      )),
    );
  }

  Container getOtpBtn() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 4,
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sendOtp,
                style: middleWare.customTextStyle(
                    18.00, Colors.white, FontWeight.normal)),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        onPressed: () async {},
      ),
    );
  }

  Container getMobileNumberController() {
    return Container(
      margin: EdgeInsets.only(
        left: middleWare.minimumPadding * 8,
        right: middleWare.minimumPadding * 8,
      ),
      child: TextFormField(
        style: middleWare.customTextStyle(14.00, Colors.black, FontWeight.bold),
        controller: mobileController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: enter_your_mobile,
          isDense: true,
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "+91",
              style: middleWare.customTextStyle(
                  15, Colors.black, FontWeight.normal),
            ),
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          filled: true,
          fillColor: textFieldBackgrounColor,
          hintStyle:
              middleWare.customTextStyle(14.00, uiBetaColor, FontWeight.normal),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide.none,
          ),
        ),
        /*onChanged: onSearchTextChanged,*/
        // ),
      ),
    );
  }
}
