import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Searchboxpage extends StatefulWidget {
  const Searchboxpage({Key? key}) : super(key: key);

  @override
  _SearchboxpageState createState() => _SearchboxpageState();
}

class _SearchboxpageState extends State<Searchboxpage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredItems = [];
  List<Map<String, dynamic>> filteredcity = [];
  static bool isDataLoaded = false;
  var items = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> cachedItems = [];
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  bool isLoading = false;
  bool isBottomSheetVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    loadData();
    _initSpeech();
  }

  Future<void> loadData() async {
    try {
      if (isDataLoaded) {
        print('Data already loaded, skipping API call');
        return;
      }

      setState(() {
        isLoading = true;
      });

      final response = await http.post(
        Uri.parse('https://eat.ind.in/api/user/appslider.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({}),
      );

      print('API Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        if (responseData.containsKey("data") && responseData["data"] is Map) {
          var data = responseData["data"];

          if (data.containsKey("Listof_Kitchens") &&
              data["Listof_Kitchens"] is List) {
            items.value = List<Map<String, dynamic>>.from(
              data["Listof_Kitchens"],
            );
            cachedItems = List<Map<String, dynamic>>.from(items);
            filterItems(''); // Initial load with an empty search query
          } else {
            print('Invalid or missing Listof_Kitchens data');
          }
        } else {
          print('Invalid data format');
        }

        setState(() {
          isDataLoaded = true;
          isLoading = false;
        });
      } else {
        print('HTTP Error: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = List<Map<String, dynamic>>.from(cachedItems);
      } else {
        filteredItems = cachedItems
            .where((item) =>
        item['kname'].toLowerCase().contains(query.toLowerCase()) ||
            item['city'].toLowerCase().contains(query.toLowerCase())||item['country'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _initSpeech() async {
    bool available = await _speechToText.initialize();
    if (available) {
      _speechEnabled = true;
    } else {
      _speechEnabled = false;
    }
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      isBottomSheetVisible = true;
    });
  }


  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
    Navigator.pop(context);
  }

  Future _displayBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text('Listening....',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
            SizedBox(height: 30,),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/Nt6v.gif', scale: 10,),
            ),
            SizedBox(height: 20,),
            Text(_lastWords,style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (result.finalResult) {
      setState(() {
        _lastWords = result.recognizedWords;
        searchController.text = _lastWords;
        filterItems(_lastWords);
      });

      Navigator.pop(context);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: searchController,
                  onChanged: filterItems,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Container(
                            height: 20,
                            child: VerticalDivider(
                              width: 5,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (_speechToText.isListening) {
                              _stopListening();
                              setState(() {
                                isBottomSheetVisible = false;
                              });
                            } else {
                              _startListening();
                              setState(() {
                                _displayBottomSheet(context);
                                isBottomSheetVisible = true;
                              });
                            }
                          },
                          icon: Icon(Icons.mic),
                          color: Colors.black,
                        )

                      ],
                    ),
                    hintText: 'Search favorite item....',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                ListTile(
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                  leading: Container(
                                    height: 80,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            items[index]["kitchenpic"] ?? ''),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  title: Text(filteredItems[index]['kname']),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on, size: 20),
                                      SizedBox(width: 10),
                                      Text(
                                        items[index]["city"] ?? '',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(width: 10),
                                      Text(items[index]["country" ?? '']),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
