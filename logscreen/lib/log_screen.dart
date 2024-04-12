import 'package:flutter/material.dart';

import 'Home_main_Page/home page.dart';
import 'Netconnectivite Check.dart';

void main() {
  runApp(MaterialApp(
    home: Two(),
  ));
}

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  final phoneController = TextEditingController();
  final dynokey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  width: size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/92078683.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: size.width,
                height: 447,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFF707070)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.10),
                    Center(
                      child: Text(
                        'Login with Mobile Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFC0E360C),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Center(
                      child: Form(
                        key: dynokey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                return 'Enter a valid 10-digit phone number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10), // Center the text horizontally
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                  color: Color(0xFFB2B2B2),
                                  width: 1,
                                ),
                              ),
                            ),
                            textAlign: TextAlign.start, // Center the text vertically
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Center(
                      child: Container(
                        width: size.width * 0.70,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFC0E360C),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Color(0xFF707070)),
                        ),
                        child: InkWell(
                          onTap: () {
                           setState(() {
                             if (dynokey.currentState!.validate()) {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => InterNetCheck()));
                             }
                           });
                          },
                          child: Center(
                            child: Text(
                              'SEND',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


