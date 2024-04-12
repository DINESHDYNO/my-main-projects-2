import 'package:flutter/material.dart';

import '../constant/Constant.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        width: size.width,
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Save Changes",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/38.png",
              color: Colors.black,
              scale: 3,
            ),
          ),
          title: const Text(
            "Confirm Password",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Old Password",
                  style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontFamily: "SFPRODISPLAYMEDIUM"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          obscureText: _isObscured,
                          decoration: const InputDecoration(
                              hintText: "Old Password",
                              hintStyle:
                              TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                              border: InputBorder.none),
                        ),
                        trailing: GestureDetector(
                            onTap: _togglePasswordVisibility,
                            child: Image.asset(
                              'assets/images/8.png',
                              scale: 2.5,
                            )),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "New Password",
                  style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontFamily: "SFPRODISPLAYMEDIUM"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          obscureText: _isObscured,
                          decoration: const InputDecoration(
                              hintText: "New Password",
                              hintStyle:
                              TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                              border: InputBorder.none),
                        ),
                        trailing: GestureDetector(
                            onTap: _togglePasswordVisibility,
                            child: Image.asset(
                              'assets/images/8.png',
                              scale: 2.5,
                            )),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontFamily: "SFPRODISPLAYMEDIUM"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          obscureText: _isObscured,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle:
                            TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                            border: InputBorder.none,
                          ),
                        ),
                        trailing: GestureDetector(
                            onTap: _togglePasswordVisibility,
                            child: Image.asset(
                              'assets/images/8.png',
                              scale: 2.5,
                            )),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
