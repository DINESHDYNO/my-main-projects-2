import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';


class RegisterMobileVerifyPage extends StatefulWidget {
  const RegisterMobileVerifyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisterMobileVerifyState();
}

class RegisterMobileVerifyState extends State<RegisterMobileVerifyPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            getMainContainer(),
          ],
        ),
      ),
    );
  }

  Widget getMainContainer() => Stack(
    children: [
      Image.asset(
        'assets/images/Spicy-veg-biryani-143389-pixahive-min.jpg',
        height: MediaQuery.of(context).size.height * 0.35,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
      ),
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 5,
              child: getRegisterStepOne(),
            ),
          ),
        ),
      ),
    ],
  );

  Widget getRegisterStepOne() => Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Let's get started!",
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        getNameController(),
        const SizedBox(height: 15),
        getLocationController(),
        const SizedBox(height: 15),
        getMobileNumberController(),
        const SizedBox(height: 20),
        getRegisterBtn(),
        const SizedBox(height: 10),
        GestureDetector(
          child: const Text(
            "Already a user? Login",
            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 50),
      ],
    ),
  );

  Container getLocationController() => Container(
    margin: const EdgeInsets.only(left: 20, right: 20,),
    child: Opacity(
      opacity: 0.8,
      child: TextFormField(
        style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        controller: locationController,
        keyboardType: TextInputType.text,
        validator: (value) {
          value = value ?? "";
          if (value.trim().replaceAll(RegExp(r'\s+'), '').isEmpty) {
            return "Please enter Location";
          } else if (value.trim().replaceAll(RegExp(r'\s+'), '').length < 5) {
            return "Please enter valid Location";
          }
          return null;
        },
        decoration: constInputDecoration(
          hintText: "Location",
          icon: Icons.location_on_outlined,
        ),
        onChanged: (val) {
          getSuggestion(val);
        },
      ),
    ),
  );

  Container getNameController() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        value = value ?? "";
        if (value.trim().replaceAll(RegExp(r'\s+'), '').isEmpty) {
          return "Please enter name";
        } else if (value.trim().replaceAll(RegExp(r'\s+'), '').length < 3) {
          return "Please enter a valid name";
        }
        return null;
      },
      decoration: constInputDecoration(
        hintText: "Enter your name",
        icon: Icons.person_outline,
      ),
    ),
  );

  Container getMobileNumberController() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      controller: mobileController,
      keyboardType: TextInputType.number,
      validator: (value) {
        value = value ?? "";
        if (value.trim().replaceAll(RegExp(r'\s+'), '').isEmpty) {
          return "Please enter mobile number";
        } else if (value.trim().replaceAll(RegExp(r'\s+'), '').length != 10) {
          return "Please enter a valid mobile number";
        }
        return null;
      },
      decoration: constInputDecoration(
        hintText: "Enter your mobile",
        prefixIcon: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text("+91", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)),
        ),
        icon: Icons.phone_android,
      ),
    ),
  );
  Container getRegisterBtn() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: uiAlphaColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Register", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal)),
          SizedBox(width: 8),
        ],
      ),
      onPressed: () {
        // Handle register button press
      },
    ),
  );

  AppBar getAppBar() => AppBar(
    automaticallyImplyLeading: false,
    title: GestureDetector(
      child: const Row(
        children: [
          Icon(Icons.arrow_back_ios,size: 20,),
          SizedBox(width: 5,),
          Text("Partner Description", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500)),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  );

  void getSuggestion(String input) async {
    // Your getSuggestion implementation here
  }


  InputDecoration constInputDecoration({
    String? hintText,
    IconData? icon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
      prefixIcon: prefixIcon != null ? Container(margin: const EdgeInsets.only(left: 10, right: 10), child: prefixIcon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    );
  }
}
