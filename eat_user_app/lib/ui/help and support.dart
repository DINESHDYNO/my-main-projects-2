/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class helpandSupport extends StatelessWidget {
  const helpandSupport({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
             const Text("Help and Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            GestureDetector(
              onTap: () {
                launchEmail('abishek6789123@gmail.com');
              },
              child: Text(
                'Tap to launch email',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                launchPhoneNumber('8637468480');
              },
              child: Text(
                'Tap to launch phone number',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      // Handle error, e.g., show an alert
      print('Could not launch email');
    }
  }

  void launchPhoneNumber(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      // Handle error, e.g., show an alert
      print('Could not launch phone number');
    }
  }
}*/
