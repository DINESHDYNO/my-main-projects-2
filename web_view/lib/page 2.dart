import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ram extends StatefulWidget {
  const ram({super.key});

  @override
  State<ram> createState() => _ramState();
}

class _ramState extends State<ram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Telegram'),
        backgroundColor: Colors.blue,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse('https://web.telegram.org/k/')
        ),
      ),
    );
  }
}
