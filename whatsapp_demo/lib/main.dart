import 'package:flutter/material.dart';
import 'package:whatsapp_demo/calllist.dart';
import 'package:whatsapp_demo/chatslist.dart';
import 'package:whatsapp_demo/statuslist.dart';

void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const two(),
    );
  }
}

class two extends StatelessWidget {
  const two({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                child: const Icon(Icons.search),
                onTap: () {},
              ),
              PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(child: Text('New Group')),
                      const PopupMenuItem(child: Text('New Broadcast')),
                      const PopupMenuItem(child: Text('Linked Devices')),
                      const PopupMenuItem(child: Text('Starred Message')),
                      const PopupMenuItem(child: Text('Settings')),
                    ];
                  })
            ],
            title: const Text('WhatsApp'),
            backgroundColor: Color(0xff128C7E),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.camera_alt_rounded,
                  ),
                  iconMargin: EdgeInsets.all(100),
                ),
                Tab(
                  child: Text(
                    'CHATS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    'STATUS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    'CALL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              labelColor: Colors.white,
            ),
          ),
          body: const TabBarView(children: [
            Center(child: Text('page:1'),),
            chat(),
            StatusTab(),
            SingleCallWidget(),
          ]),
        ));
  }
}
