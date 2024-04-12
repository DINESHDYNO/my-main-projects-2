import 'package:drawer_demo/1page.dart';
import 'package:drawer_demo/2page.dart';
import 'package:drawer_demo/3page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
      color: Colors.green,
    );
  }
}





class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ));
        }),
        title: Text(
          'Drawer',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 20,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture:const CircleAvatar(
                backgroundImage: AssetImage('assets/images/kumar.png'),
              ),
              accountName: const Text('Dinesh'),
              accountEmail: Text('dinesh0471dineh0471@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                // Set the background color you desire
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/kumar1.png'),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shopping Histroy'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page1()));
              },
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.mail_outline_sharp),
              title: Text('Mails'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page2()));
              },
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notification'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page3()));
              },
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.library_music_sharp),
              title: Text('Music Library'),
              onTap: () {},
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Log Out'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
                width: 400,
                height: 400,
              ),
            ],
          )
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/kumar.png'),
              ),
              accountName: Text('Dinesh'),
              accountEmail: Text('dinesh0471dineh0471@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                // Set the background color you desire
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/kumar1.png'),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shopping Histroy'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page1()));
              },
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.mail_outline_sharp),
              title: Text('Mails'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page2()));
              },
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notification'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page3()));
              },
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.library_music_sharp),
              title: Text('Music Library'),
              onTap: () {},
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Log Out'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}


