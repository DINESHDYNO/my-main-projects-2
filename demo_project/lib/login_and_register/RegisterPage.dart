import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../BottomBar/bottomNavigation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectDate = '';
  bool _isChecked = false;

  String? selectedOption1;
  String? selectedOption2;
  List<String>items1=['Self', 'Other'];
  List<String>items2=['Male', 'Female'];

  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd MMM yyyy').format(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSection(size),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                   SizedBox(height: 20),
                  _buildDropdown(size,'On behalf',selectedOption1, (value) => setState(() => selectedOption1 = value),items1),
                   SizedBox(height: 20),
                  _buildTextFormField('First Name', 'Enter Your First Name'),
                   SizedBox(height: 20),
                  _buildTextFormField('Last Name', 'Enter Your Last Name'),
                   SizedBox(height: 20),
                  _buildDropdown(size,'Gender',selectedOption2, (value) => setState(() => selectedOption2 = value),items2),
                   SizedBox(height: 20),
                  _buildDateField(),
                   SizedBox(height: 20),
                  _buildTextFormField('Email', 'Enter your Email'),
                   SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Use Phone Number',
                          style: TextStyle(fontSize: 15, color: primaryColor, decoration: TextDecoration.underline,fontFamily: "SFPRODISPLAYMEDIUM"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField('Password', 'Password'),
                  const SizedBox(height: 20),
                  _buildTextFormField('Confirm Password', 'Confirm Password'),
                  const SizedBox(height: 20),
                  _buildTextFormField('Refer Code', 'Type your refer Code'),
                ],
              ),
            ),
             SizedBox(height: 20),
            _buildTermsAndConditions(),
            const SizedBox(height: 20),
            _buildSignUpButton(),
            const SizedBox(height: 20),
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
                Text(
                  'Create your Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
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

  Widget _buildDropdown(Size size,String label ,String? selectedOption, void Function(String?) onChanged,List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 15, color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM")),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(top: 5),
          height: 60,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              hint: const Text('Select an option'),
              value: selectedOption,
              onChanged: onChanged,
              items: items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFormField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 15, color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM")),
        const SizedBox(height: 10),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5),
            child: ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Date of Birth", style: TextStyle(fontSize: 15, color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM")),
        const SizedBox(height: 10),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ListTile(
              title: TextFormField(
                controller: _dateController,
                readOnly: true,
                enableInteractiveSelection: false,
                onTap: () {
                  _selectDate();
                },
                decoration: const InputDecoration(
                  hintText: "Select Your Date of Birth",
                  hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                  border: InputBorder.none,
                ),
              ),
              trailing: InkWell(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    _dateController.text = DateFormat('dd MMM yyyy').format(pickedDate);
                    print(pickedDate);
                  }
                },
                child: Image.asset("assets/images/15.png", scale: 2.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: primaryColor,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue ?? false;
            });
          },
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('I agree to the ', style: TextStyle(color: Colors.black, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM")),
              Text('Terms & Conditions', style: TextStyle(color: primaryColor, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM")),
              Text(' & ', style: TextStyle(color: Colors.black, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM")),
              Text('Privacy Policy', style: TextStyle(color: primaryColor, fontSize: 14,fontFamily: "SFPRODISPLAYMEDIUM")),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        minWidth: double.infinity,
        height: 50,
        color: primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeBottomNavigationScreen()));
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
