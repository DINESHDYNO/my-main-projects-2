import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant/Constant.dart';


class AstronomicInformation extends StatefulWidget {
  const AstronomicInformation({super.key});

  @override
  State<AstronomicInformation> createState() => _AstronomicInformationState();
}

class _AstronomicInformationState extends State<AstronomicInformation> {

  final TextEditingController _dateController=TextEditingController();
  String? selectedMealType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(child: Scaffold(
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
        preferredSize: Size.fromHeight(64),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/38.png",color: Colors.black,scale: 3,)
          ),
          title: const Text(
            "Astronomic Information",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Manglik/Chevvai Dosham:", style: TextStyle(
                color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildRadio('Yes'),
                buildRadio('No'),
                buildRadio("Don't know"),
              ],
            ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Raasi/Moon Sign:',
                  style: TextStyle(
                      color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      items: [],
                      onChanged: (value) {
                      },
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
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Star',
                  style: TextStyle(
                      color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      items: [],
                      onChanged: (value) {
                      },
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
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gothram:',
                  style: TextStyle(
                      color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      items: [],
                      onChanged: (value) {
                      },
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
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Country Of Birth:',
                        style: TextStyle(
                            color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: size.width/2.5,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Birthday:',
                      style: TextStyle(
                          color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: size.width/2.5,
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Time Of Birth:',
                      style: TextStyle(
                          color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: size.width/2.5,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15)
                      ),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Time Of Birth:",
                                hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                                border: InputBorder.none
                            ),
                          ),
                        )
                    ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Place Of Birth:',
                      style: TextStyle(
                          color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: size.width/2.5,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15)
                      ),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Place Of Birth:",
                                hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),
                                border: InputBorder.none
                            ),
                          ),
                        )
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 70,),
        ],
      ),
    ));
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
          activeColor:primaryColor,
        ),
        Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 17,fontFamily: "SFPRODISPLAYMEDIUM"),),
      ],
    );
  }
}
