import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main(){
  runApp( one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Eat App mic testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Search Foods',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    suffixIcon: IconButton(
                      onPressed: _speechToText.isNotListening ? _startListening : _stopListening,
                      icon: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),),
                    hintText: 'Tap the microphone to start listening...',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     /* floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),*/
    );
  }
}