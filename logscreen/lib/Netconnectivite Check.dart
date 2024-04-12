import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logscreen/Home_main_Page/home%20page.dart';

class InterNetCheck extends StatefulWidget {
  const InterNetCheck({Key? key});

  @override
  State<InterNetCheck> createState() => _InterNetCheckState();
}

class _InterNetCheckState extends State<InterNetCheck> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            // sometimes the stream builder doesn't work with simulator so you can check this on real devices to get the right result
            print(snapshot.toString());
            if (snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
                return BottomNavigationScreen();
              } else {
                return noInternet();
              }
            } else {
              return loading();
            }
          },
        ),
      ),
    );
  }

  Widget loading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(), // Add a circular loading indicator
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: const Text(
            "Checking internet connection...",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget noInternet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/no-wifi.png',
          height: 120,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "No Internet connection",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text("Check your connection, then retry the page."),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () async {
           setState(() {

           });
          },
          child: const Text("Retry"),
        ),
      ],
    );
  }
}
