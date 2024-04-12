import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home : imagepickingPage(),
    );
  }
}


class imagepickingPage extends StatefulWidget {
  const imagepickingPage({Key? key}) : super(key: key);

  @override
  State<imagepickingPage> createState() => _imagepickingPageState();
}

class _imagepickingPageState extends State<imagepickingPage> {

  File ? image;



  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      e.stacktrace;
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image!.path);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: image != null ? Image.file(image!) : Text("Add Image"),
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: () {
              if (image != null) {

              }
              getImage();
            }, child: Text('tap me to gallery')),
            TextButton(onPressed: () {
              pickImageC();
            }, child: Text("Tap Me for camera")),

            TextButton(onPressed: (){
              setState(() {
                image = null;
              });
            }, child:Text('remove image'))
          ],
        ),
      ),
    );
  }
}
