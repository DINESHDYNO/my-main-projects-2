import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void saveUserCredentials(String name, String password) async {
    SharedPreferences ram = await SharedPreferences.getInstance();
    await ram.setString('username', name);
    await ram.setString('password', password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.account_circle_rounded,
                size: 100,
                color: Colors.teal,
              ),
            ),
            Center(
              child: Text(
                ' Create your account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                if (username.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Username and Password Required', style: TextStyle(fontWeight: FontWeight.bold)),
                        content: Text('Please enter your username and password.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  saveUserCredentials(username, password);
                  Navigator.pop(context);
                }
              },
              child: Text('Create your account'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 63, vertical: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
