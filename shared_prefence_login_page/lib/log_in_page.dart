import 'package:flutter/material.dart';
import 'package:shared_prefence_login_page/Home+page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefence_login_page/reg.dart';


class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();



  bool loggedIn = false;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future checkLoginStatus() async {
    SharedPreferences ram = await SharedPreferences.getInstance();
    String? savedUsername = ram.getString('username');
    String? savedPassword = ram.getString('password');
    if (savedUsername != null && savedPassword != null) {
      setState(() {
        loggedIn = true;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Log in page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Center(
            child: Icon(
              Icons.account_circle_rounded,
              size: 100,
              color: Colors.deepPurple,
            ),
          ),
          Center(
            child: Text(
              ' Log in your account',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: username_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              obscureText: true,
              controller: password_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(width: 40,),
          Container(
            child: Row(
              children: [
                SizedBox(width: 15,),
                TextButton(onPressed: () async {
                  String username = username_controller.text;
                  String password = password_controller.text;

                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? savedUsername = prefs.getString('username');
                  String? savedPassword = prefs.getString('password');

                  if (username == savedUsername && password == savedPassword) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                  }else{
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text('Invalid Credentials',style: TextStyle(fontWeight: FontWeight.bold),),
                        content: Text('Please check your username and password.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.red
                            ),
                          ),
                        ],
                      );
                    },
                    );
                  }
                }, child: Text('Log in',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 13)
                  ),
                ),
                SizedBox(width: 20,),
                TextButton(onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RegPage()));
                }, child: Text('Registor',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 63,vertical: 13)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}