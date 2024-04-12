import 'package:flutter/material.dart';

import '../BottomBar/bottomNavigation.dart';
import '../constant/Constant.dart';
import 'RegisterPage.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSection(size),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Address",
                    style: TextStyle(fontSize: 15, color: Colors.red,fontFamily: "SFPRODISPLAYMEDIUM"),
                  ),
                  const SizedBox(height: 10),
                  _buildInputField("Enter your Address", "assets/images/7.png"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Use Phone Number',
                    style: TextStyle(
                      fontFamily: "SFPRODISPLAYMEDIUM",
                      fontSize: 15,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 15, color: Colors.red,
                      fontFamily: "SFPRODISPLAYMEDIUM"
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInputField("Enter Password", 'assets/images/9.png'),
                ],
              ),
            ),
            const SizedBox(height: 10),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontFamily: "SFPRODISPLAYMEDIUM",
                        fontSize: 15, color: Colors.red),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minWidth: double.infinity,
                height: 50,
                color: primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeBottomNavigationScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an account? ",
                      style: TextStyle(
                          fontFamily: "SFPRODISPLAYMEDIUM",
                          color: Colors.grey, fontSize: 15
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Or',
                  style: TextStyle(
                      fontFamily: "SFPRODISPLAYMEDIUM",
                      fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: greyColor),
                  child: Center(child: Image.asset('assets/images/10.png')),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: greyColor),
                  child: Center(child: Image.asset('assets/images/11.png')),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: greyColor),
                  child: Center(child: Image.asset('assets/images/12.png')),
                )
              ],
            ),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Contact   |   FAQ', style: TextStyle(
                    fontFamily: "SFPRODISPLAYMEDIUM",
                    color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(Size size) {
    return Container(
      height: size.height * 0.3,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/5.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
           Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: Image.asset('assets/images/6.png'),
                ),
                const Text(
                  'Login To Your Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String hintText, String icon) {
    return Container(
      height: 60,
      decoration:  BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListTile(
          title: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontFamily:"SFPRODISPLAYMEDIUM",fontSize: 16),
              border: InputBorder.none,
            ),
          ),
          trailing: Image.asset(icon, scale: 2.5),
        ),
      ),
    );
  }

}
