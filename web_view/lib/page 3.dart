import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Facebook'),
          backgroundColor: Colors.blueAccent,
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://www.facebook.com/'),
          ),
        )
    );
  }
}
