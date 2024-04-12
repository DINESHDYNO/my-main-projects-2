import 'package:flutter/material.dart';
import '../constant/Constant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedMealType;

  Widget buildTextField(String label, {bool isAge = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: primaryColor, fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: isAge ? 'Enter Age' : 'Select',
                      hintStyle: TextStyle(color: Colors.grey,fontFamily: "SFPRODISPLAYMEDIUM"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: primaryColor, fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: DropdownButton(
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  items: [],
                  onChanged: (value) {},
                  hint: Text(
                    'Select',
                    style: TextStyle(color: Colors.grey[700],fontFamily: "SFPRODISPLAYMEDIUM"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                'Search',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Row(
              children: [
                buildTextField('Age From', isAge: true),
                buildTextField('To', isAge: true),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Member ID", style: TextStyle(color: primaryColor, fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                  title: Text(
                    'DH838388',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDropdown('Religion'),
                buildDropdown('Caste'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDropdown('Sub Caste'),
                buildDropdown('Country'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDropdown('State'),
                buildDropdown('City'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTextField('Min Height'),
                buildTextField('Max Height'),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Member Type", style: TextStyle(color: primaryColor, fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM")),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildRadio('Premium'),
                buildRadio('Free'),
                buildRadio('All'),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minWidth: double.infinity,
                height: 50,
                color: primaryColor,
                onPressed: () {},
                child: const Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildRadio(String label) {
    return Row(
      children: [
        Radio(
          value: label,
          groupValue: selectedMealType,
          onChanged: (value) {
            setState(() {
              selectedMealType = value.toString();
            });
          },
          activeColor: primaryColor,
        ),
        Text(label, style: const TextStyle(fontSize: 17,fontFamily: "SFPRODISPLAYMEDIUM")),
      ],
    );
  }
}
