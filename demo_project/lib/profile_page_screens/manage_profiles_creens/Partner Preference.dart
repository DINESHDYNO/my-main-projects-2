import 'package:flutter/material.dart';

import '../../constant/Constant.dart';

class PartnerPreference extends StatefulWidget {
  const PartnerPreference({super.key});

  @override
  State<PartnerPreference> createState() => _PartnerPreferenceState();
}

class _PartnerPreferenceState extends State<PartnerPreference> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedbox1;
  String? selectedbox2;
  String? selectedbox3;
  String? selectedbox4;
  String? selectedbox5;
  List<String> boxdata1=["Unmarried","Married"];
  List<String> boxdata2=["Unmarried","Married"];
  List<String> boxdata3=["Unmarried","Married"];
  List<String> boxdata4=["Unmarried","Married"];
  List<String> boxdata5=["Unmarried","Married"];


  //Age,height,mother tongue,relidion....
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;
  String? selectedOption4;
  String? selectedOption5;
  String? selectedOption6;
  String? selectedOption7;
  String? selectedOption8;
  String? selectedOption9;
  String? selectedOption10;
  String? selectedOption11;
  String? selectedOption12;
  List<String>items1=[ '19', '21','22', '23','24', '25','26', '27',];
  List<String>items2=['19', '21','22', '23','24', '25','26', '27',];
  List<String>items3=['150 cm','165 cm','170 cm','175 cm','180 cm','185 cm','190 cm',];
  List<String>items4=['150 cm','165 cm','170 cm','175 cm','180 cm','185 cm','190 cm',];
  List<String>items5=['Tamil','English'];
  List<String>items6=["Christian","Protestant"];
  List<String>items7=['MBC','BC','SC'];
  List<String>items8=["Christian","Protestant"];
  List<String>items9=['India','Pakisthan'];
  List<String>items10=['Non Vegetarian','Vegetarian'];
  List<String>items11=['Non-Smoker','Smoker'];
  List<String>items12=['Non-Drinker','Drinker'];

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            onPressed: () {
              _saveChanges();
            },
            child: const Text("Save Changes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
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
              child: Image.asset("assets/images/38.png", color: Colors.black, scale: 3),
            ),
            title: const Text(
              "Partner Preference",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              height20Space,
              buildDropdown(size,'Marital Status', selectedbox1, (value) => setState(() => selectedbox1 = value),boxdata1),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRangeDropdown(size,'Age From', selectedOption1, (value) => setState(() => selectedOption1 = value),items1),
                  buildRangeDropdown(size,"To", selectedOption2, (value) => setState(() => selectedOption2 = value),items2),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRangeDropdown(size,'Height From', selectedOption3, (value) => setState(() => selectedOption3 = value),items3),
                  buildRangeDropdown(size,"To", selectedOption4, (value) => setState(() => selectedOption4 = value),items4),
                ],
              ),
              const SizedBox(height: 20),
              buildDropdown(size,'Physical Status', selectedbox2, (value) => setState(() => selectedbox2 = value),boxdata2),
              const SizedBox(height: 20,),
              const Text("Cultural Background", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRangeDropdown(size,'Mother Tongue', selectedOption5, (value) => setState(() => selectedOption5 = value),items5),
                  buildRangeDropdown(size,"Religion", selectedOption6, (value) => setState(() => selectedOption6 = value),items6),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRangeDropdown(size,'Caste', selectedOption7, (value) => setState(() => selectedOption7 = value),items7),
                  buildRangeDropdown(size,"Religion", selectedOption8, (value) => setState(() => selectedOption8 = value),items8),
                ],
              ),
              const SizedBox(height: 20),
              buildDropdown(size,'Education', selectedbox3, (value) => setState(() => selectedbox3 = value),boxdata3),
              const SizedBox(height: 20),
              buildDropdown(size,'Occupation', selectedbox4, (value) => setState(() => selectedbox4 = value),boxdata4),
              const SizedBox(height: 20),
              const Text("Location", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRangeDropdown(size,'Country', selectedOption9, (value) => setState(() => selectedOption9 = value),items9),
                  buildRangeDropdown(size,"Lifestyle - Habits", selectedOption10, (value) => setState(() => selectedOption10 = value),items10),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRangeDropdown(size,'Smoking Habits', selectedOption11, (value) => setState(() => selectedOption11 = value),items11),
                  buildRangeDropdown(size,"Drinking Habits", selectedOption12, (value) => setState(() => selectedOption12 = value),items12),
                ],
              ),
              const SizedBox(height: 20),
              buildDropdown(size,'Monthly Income', selectedbox5, (value) => setState(() => selectedbox5 = value),boxdata5),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About My Partner',
                    style: TextStyle(
                        color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(),
                    height: 144,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1)
                    ),child: TextFormField(
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Write About your Partner...",
                        hintStyle: TextStyle(color: const Color(0xff080808).withOpacity(0.5),fontSize: 16,fontFamily: "SFPRODISPLAYMEDIUM"),
                        border: InputBorder.none
                    ),
                    minLines: 3,
                    maxLines: 5,
                  ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(Size size,String label,String? selectedOption, void Function(String?) onChanged,List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: primaryColor, fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
        ),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child:DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              hint: const Text('Select an option',style: TextStyle(fontFamily: 'SFPRODISPLAYMEDIUM'),),
              value: selectedOption,
              onChanged: onChanged,
              items: items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(fontFamily: 'SFPRODISPLAYMEDIUM'),),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRangeDropdown(Size size,String label,String? selectedOption, void Function(String?) onChanged,List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: const TextStyle(color: primaryColor, fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
        ),
        const SizedBox(height: 10),
        Container(
          height: 60,
          width: size.width / 2.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              hint: const Text('Select an option',style: TextStyle(fontFamily: 'SFPRODISPLAYMEDIUM'),),
              value: selectedOption,
              onChanged: onChanged,
              items: items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(fontFamily: 'SFPRODISPLAYMEDIUM'),),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
