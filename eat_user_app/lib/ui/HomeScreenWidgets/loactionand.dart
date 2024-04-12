import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../constant.dart';
import '../AccountPage.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = kPrimaryColor;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'West Mambalam',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  Text(
                    'Lake View Road, West Mambalam, Chennai....',
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: size.height * 0.035,
                width: size.width * 0.22,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Center(
                  child: Text(
                    'Subscription',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                },
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class thiruvalluvartext extends StatelessWidget {
  const thiruvalluvartext({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/thiruvalluvar.png',
            height: 50,
            width: 50,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              width: size.width * 0.65,
              margin: EdgeInsets.all(10),
              child: Text(
                "அகர முதல எழுத்தெல்லாம் ஆதி \nபகவன் முதற்றே உலகு...",
                style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class searchbox extends StatefulWidget {
  const searchbox({
    super.key,
  });

  @override
  State<searchbox> createState() => _searchboxState();
}

class _searchboxState extends State<searchbox> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// Initialize speech recognition
  void _initSpeech() async {
    bool available = await _speechToText.initialize();
    if (available) {
      // Speech recognition is available
      _speechEnabled = true;
    } else {
      // Speech recognition is not available
      _speechEnabled = false;
      // You may want to display an error message or take appropriate action here
    }
    setState(() {});
  }

  /// Start listening for speech
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Stop listening for speech
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// Callback when speech is recognized
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      _textEditingController.text = _lastWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFffffff),
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_outlined, color: Colors.black),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Container(
                    height: 40,
                    child: VerticalDivider(
                      width: 5,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _speechToText.isNotListening
                      ? _startListening
                      : _stopListening,
                  icon: Icon(Icons.mic),
                  color: Colors.black,
                )
              ],
            ),
            hintText: 'Search favorite item....',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold, // Set FontWeight to bold
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          textAlign: TextAlign.start,
        ),

      ),
    );
  }
}
