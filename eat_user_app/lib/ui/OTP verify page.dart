import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottom Navigation bar.dart';

class otpverification extends StatefulWidget {
  @override
  State<otpverification> createState() => _otpverificationState();
}

class _otpverificationState extends State<otpverification> {
  int _secondsRemaining = 30;

  late Timer _timer;

  TextEditingController txt1 = TextEditingController();

  TextEditingController txt2 = TextEditingController();

  TextEditingController txt3 = TextEditingController();

  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsRemaining = _secondsRemaining - 1;
      });
      if (_secondsRemaining < 1) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.green.shade700,
                Colors.green.shade600,
                Colors.green.shade300
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text(
                        "Enter Verification Code",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 1200),
                        child: Text(
                          'Enter the 6 Digit Number that we \nsend to(+91-7639400471)',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 30),
                      FadeIn(
                        duration: Duration(milliseconds: 1400),
                        child: Form(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 48,
                              width: 44,
                              child: TextFormField(
                                controller: txt1,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                              width: 44,
                              child: TextFormField(
                                controller: txt2,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                              width: 44,
                              child: TextFormField(
                                controller: txt3,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                              width: 44,
                              child: TextFormField(
                                controller: txt4,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                              width: 44,
                              child: TextFormField(
                                controller: txt4,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                              width: 44,
                              child: TextFormField(
                                controller: txt4,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 1600),
                        child: Text(
                          "Didn't Receive code? 30 seconds",
                          style: TextStyle(fontSize: 16,color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /* Text(
                        '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),*/
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: MaterialButton(
                          onPressed: () {
                            final otp =
                                txt1.text + txt2.text + txt3.text + txt4.text;
                            if (otp == '0000') {}
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationBarWidget()));
                          },
                          height: 50,
                          color: Colors.green[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "VERIFY OTP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1700),
                        child: Text(
                          "Change number",
                          style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
