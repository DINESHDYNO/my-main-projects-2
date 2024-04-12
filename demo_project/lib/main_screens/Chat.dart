
import 'package:flutter/material.dart';
import '../chat_page_screens/MainChatingPage.dart';
import '../profile_page_screens/profile_settings_screens/Notification.dart';

class ChatPage extends StatelessWidget {
  final List<ChatItemWidget> chatItems = [
    ChatItemWidget(
      name: 'Dhana lashmi',
      message: 'Today I work in a cafe. Come there, I’ll buy you…',
      time: '13:25 PM',
      unreadCount: 3,
      image: 'assets/images/69.png',
    ),
    ChatItemWidget(
      name: 'Joey',
      message: 'Do you want to hear a joke about Chandler?',
      time: '13:25 PM',
      unreadCount: 5,
      image: 'assets/images/70.png',
    ),
    ChatItemWidget(
      name: 'Ramya Krishnan',
      message: 'We’re all coming to this party. I guess you shouldn’t have found out about this.',
      time: '13:25 PM',
      unreadCount: 9,
      image: 'assets/images/71.png',
    ),
    ChatItemWidget(
      name: 'Vinothini',
      message: 'Do you want to hear a joke about Joey?',
      time: '13:25 PM',
      unreadCount: 1,
      image: 'assets/images/72.png',
    ),
    ChatItemWidget(
      name: 'Merlin',
      message: 'I heard that you are getting married. Congr.',
      time: '13:25 PM',
      unreadCount: 2,
      image: 'assets/images/76.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9F0),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 64,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.18),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
                        child: Text(
                          'Message',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Site()));
                      },
                      child: Image.asset('assets/images/17.png', scale: 3)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatItems.length,
                itemBuilder: (context, index) {
                  final item = chatItems[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChattingPage(items: chatItems[index],)));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipOval(
                                    child: Image.asset(
                                      item.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (item.unreadCount > 0)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item.message,
                                  style: const TextStyle(fontSize: 14, color: Color(0xFF8D8D8D), fontFamily: "SFPRODISPLAYMEDIUM"),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item.time,
                                style: const TextStyle(fontSize: 14, color: Color(0xFF8D8D8D), fontFamily: "SFPRODISPLAYMEDIUM"),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  item.unreadCount.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChatItemWidget  {
  const ChatItemWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
  final String image;
  final String name;
  final String message;
  final String time;
  final int unreadCount;
}


