import 'package:flutter/material.dart';
import 'package:shared_prefence_login_page/log_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = '';
    passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          Icon(Icons.menu)
        ],
        leading: Icon(Icons.account_circle),
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  'assets/images/kumar.png',
                ),
                width: 300,
                height: 300,
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => two()),
              );
            },
            icon: Icon(Icons.logout),
            label: Text('Log Out'),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          )

        ],
      ),
    );
  }
}
