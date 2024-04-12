import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class page4 extends StatefulWidget {
  const page4({super.key});

  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Youtube'),
          backgroundColor: Colors.red,
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://www.youtube.com/'),
          ),
        )
    );
  }
}
