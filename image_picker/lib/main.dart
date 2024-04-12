import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ram(),
    );
  }
}

class ram extends StatefulWidget {
  const ram({Key? key}) : super(key: key);

  @override
  State<ram> createState() => _ramState();
}

class _ramState extends State<ram> {

  File? image;
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
      appBar: AppBar(
        title:
            Container(alignment: Alignment.center, child: Text('Image Picker')),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 400,
              width: 400,
              child: image != null ? Image.file(image!) : Container(),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (image != null) {}
                  getImage();
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text('Tap me to Gallery!!'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 115, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  primary: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  pickImageC();
                },
                child: Row(
                  children: [
                    Icon(Icons.pan_tool_alt),
                    Text("Tap Me for Camera!!"),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 115, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))), primary: Colors.blue,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    image = null;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    Text('Remove Image'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 115, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))), primary: Colors.red,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
