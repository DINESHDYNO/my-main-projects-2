import 'package:eat_user_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

import 'FavouitePage.dart';
 // Updated import statement for consistency

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Manage Account',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.11,
                    width: size.width * 0.24,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/98511ee98a1930b8938e42caf0904d2d.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue.shade300),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'RAJ KUMAR',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text('rajakumar@gmail.com',
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade700,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text('8859399399',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(
                  title: "Favourite",
                  icon: Icons.favorite,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouritePage()));
                  }),
              ProfileMenuWidget(
                  title: "Subscription",
                  icon: Icons.verified_user,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Manage Addresses", icon: Icons.home, onPress: () {}),
              ProfileMenuWidget(
                  title: "Order History", icon: Icons.history, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Help",
                  icon: Icons.help,
                  onPress: () {
                    _showHelpBottomSheet(context);
                  }),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }



  void launchPhoneNumber(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      // Handle error, e.g., show an alert
      print('Could not launch phone number');
    }
  }

  void _showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Image.asset(
                    'assets/images/customer-service.png',
                    scale: 11,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Help & Support',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/chat.png',
                          scale: 18,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Chat',
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Text(
                      'coming soon....',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade600.withOpacity(0.2),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(
                    'mailto:abishek6789123@gmail.com?subject=To Eat Team&body=Hi, Welcome to Eat Help And Support',
                  );
                  if (!await launcher.launchUrl(uri)) {
                    debugPrint(
                        "Could not launch the uri"); // because the simulator doesn't has the email app
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/gmail.png',
                      scale: 18,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade600.withOpacity(0.2),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  launchPhoneNumber('9840226321');
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/phone-call.png',
                      scale: 18,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade600.withOpacity(0.2),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color textColor;
  final bool endIcon;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor = Colors.black,
    this.endIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 55,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.withOpacity(0.2)
          //color: Color(0xFF76c48a)
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 17),
          ),
          leading: Icon(icon),
          trailing: endIcon ? const Icon(Icons.arrow_forward_ios) : null,
          onTap: onPress,
        ),
      ),
    );
  }
}
