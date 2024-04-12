import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class kumar extends StatefulWidget {
  const kumar({super.key});

  @override
  State<kumar> createState() => _kumarState();
}

class _kumarState extends State<kumar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Instagram'),
        backgroundColor: Colors.pink,
      ),
     body: InAppWebView(
       initialUrlRequest: URLRequest(
         url: Uri.parse('https://www.instagram.com/'),
       ),
     )
    );
  }
}
