import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'On-going_order2.dart';


class otpverification extends StatefulWidget {
  const otpverification({super.key});

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
        _secondsRemaining=_secondsRemaining-1;
      });
      if(_secondsRemaining<1){
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
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter  OTP',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ask customer for the OTP',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 3,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: txt1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context)
                                  .nextFocus();
                            }
                          },
                          style: Theme.of(context)
                              .textTheme
                              .headline6,
                          keyboardType:
                          TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                1),
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          decoration: InputDecoration(
                            border:
                            OutlineInputBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    5)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: txt2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context)
                                  .nextFocus();
                            }
                          },
                          style: Theme.of(context)
                              .textTheme
                              .headline6,
                          keyboardType:
                          TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                1),
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          decoration: InputDecoration(
                            border:
                            OutlineInputBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    5)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: txt3,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context)
                                  .nextFocus();
                            }
                          },
                          style: Theme.of(context)
                              .textTheme
                              .headline6,
                          keyboardType:
                          TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                1),
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          decoration: InputDecoration(
                            border:
                            OutlineInputBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    5)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: txt4,
                          style: Theme.of(context)
                              .textTheme
                              .headline6,
                          keyboardType:
                          TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                1),
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          decoration: InputDecoration(
                            border:
                            OutlineInputBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    5)),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                  onTap: () {
                    if (_secondsRemaining <= 0) {
                      _secondsRemaining = 30;
                      _startTimer();
                    }
                  },
                  child: Text('Resend  OTP',)),
              Container(
                height: 1.2,
                width: 80,
                color: Colors.black,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              color: Colors.red,
                              fontSize: 18),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          final otp = txt1.text +
                              txt2.text +
                              txt3.text +
                              txt4.text;
                          if (otp == '0000') {
                            Navigator.of(context)
                                .pushReplacement(
                                MaterialPageRoute(
                                    builder:
                                        (context) =>
                                        On_going_order2()));
                          }
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              color: Colors.green,
                              fontSize: 18),
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
