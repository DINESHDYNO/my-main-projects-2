import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  List<String> imagePaths = [];
  List<Map<String, dynamic>> kitchens = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    startImageCarousel();
  }

  Future<void> fetchData() async {
    try {
      String url = 'https://eat.ind.in/api/user/appslider.php';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['status'] == 'error') {
          print('Error: ${data['message']}');
        } else {
          var appSlider = data['data']['App_slider'];
          var listofKitchens = data['data']['Listof_Kitchens'];

          if (appSlider is List) {
            setState(() {
              imagePaths = List<String>.from(appSlider.map((item) => item['image']));
            });
          } else {
            print('Invalid data format. Expected App_slider to be a List, but received: $appSlider');
          }

          if (listofKitchens is List) {
            setState(() {
              kitchens = List<Map<String, dynamic>>.from(listofKitchens);
            });
          } else {
            print('Invalid data format. Expected Listof_Kitchens to be a List, but received: $listofKitchens');
          }
        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void startImageCarousel() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      int nextPage = _pageController.page!.round() + 1;
      if (nextPage == imagePaths.length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Available Kitchens',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: kitchens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(kitchens[index]['kitchenpic']),
                  ),
                  title: Text(kitchens[index]['kname']),
                  subtitle: Text(kitchens[index]['address']),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
