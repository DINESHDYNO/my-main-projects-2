import 'package:flutter/material.dart';

import '../../constant/Constant.dart';


class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;
  String? selectedOption4;
  String? selectedOption5;
  String? selectedOption6;
  String? selectedOption7;
  String? selectedOption8;

  List<String>items1=['Male', 'Female'];
  List<String>items2=['Male', 'Female'];
  List<String>items3=['Male', 'Female'];
  List<String>items4=['Male', 'Female'];
  List<String>items5=['Tamil', 'English'];
  List<String>items6=['Male', 'Female'];
  List<String>items7=['Male', 'Female'];
  List<String>items8=['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                Text("Save Changes",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
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
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/38.png",color: Colors.black,scale: 3,)),
            title: const Text("Basic Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            _buildTextInputField(size, 'Name', 'Enter Your Name'),
            const SizedBox(height: 20),
            _buildTextInputField(size, 'Living Place:', 'Enter Your Place'),
            const SizedBox(height: 20),
            _buildTextInputField(size, 'Email:', 'Enter Your Email'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(size,'I Am A:', selectedOption1, (value) => setState(() => selectedOption1 = value),items1),
                _buildDropdown(size,'Marital Status: *', selectedOption2, (value) => setState(() => selectedOption2 = value),items2),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(size,'Caste', selectedOption3, (value) => setState(() => selectedOption3 = value),items3),
                _buildDropdown(size,'Sub Caste', selectedOption4, (value) => setState(() => selectedOption4 = value),items4),
              ],
            ),
            const SizedBox(height: 20,),
            _buildDropdown1(size,'Mother Tongue:',selectedOption5, (value) => setState(() => selectedOption5 = value),items5),
            const SizedBox(height: 20,),
            _buildDropdown1(size,'Complexion:',selectedOption6, (value) => setState(() => selectedOption6 = value),items6),
            const SizedBox(height: 20,),
            _buildDropdown1(size,'Profile Created By:',selectedOption7, (value) => setState(() => selectedOption7 = value),items7),
            const SizedBox(height: 20,),
            _buildDropdown1(size,'Languages Known',selectedOption8, (value) => setState(() => selectedOption8 = value),items8),
            const SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
  Widget _buildTextInputField(Size size, String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: pink15RegularTextStyle,),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: const Color(0xff080808).withOpacity(0.5),
                    fontSize: 16,
                    fontFamily: "SFPRODISPLAYMEDIUM",
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(Size size,String lable, String? selectedOption, void Function(String?) onChanged,List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(lable, style: pink15RegularTextStyle),
        const SizedBox(height: 10,),
        Container(
          height: 60,
          width: size.width / 2.5,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
  Widget _buildDropdown1(Size size,String label ,String? selectedOption, void Function(String?) onChanged,List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: pink15RegularTextStyle,
        ),
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
}
