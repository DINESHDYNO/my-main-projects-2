// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'RecipeDataProvider.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String? selectedOption;
  String? selectedMealType;
  String? selectedPreOrderDailyorder;
  bool isSelectedBannanaLeaf = false;
  bool isSelectedContainer = false;
  String selectedSize = '250ml';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? selectedimage;

  Future<void> _pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedimage = File(pickedFile.path);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    selectedMealType = 'Breakfast';
    selectedPreOrderDailyorder='Daily Order';
    isSelectedContainer = true;
    isSelectedBannanaLeaf = false;
    selectedSize = '250ml';
  }
  void _saveData() {
    if (_formKey.currentState?.validate() ?? false) {
      if (selectedimage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please upload an image'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        RecipeDataProvider recipeProvider =
        Provider.of<RecipeDataProvider>(context);
        RecipeData recipeData = RecipeData(
          name: nameController.text,
          description: descriptionController.text,
          quantity: quantityController.text,
          price: priceController.text,
          selectedOption: selectedOption ?? '',
          selectedMealType: selectedMealType ?? '',
          selectedPreOrderDailyorder: selectedPreOrderDailyorder ?? '',
          isSelectedBannanaLeaf: isSelectedBannanaLeaf,
          isSelectedContainer: isSelectedContainer,
          selectedSize: selectedSize,
          imagePath: selectedimage!.path,
        );
        recipeProvider.setRecipeData(recipeData);
        Navigator.pop(context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'ADD ITEMS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Recipe Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Recipe Name',
                      errorStyle: const TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonFormField<String>(
                    value: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    items: ['Veg', 'Non Veg']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Select Type',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a Type';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    contentPadding:const EdgeInsets.all(0),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildRadio('Breakfast'),
                        buildRadio('Lunch'),
                        buildRadio('Snacks'),
                        buildRadio('Dinner'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Description';
                      }
                      return null;
                    },
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                buildQuantityInput(
                    'ESTIMATE QUANTITY       :', quantityController),
                buildQuantityPriceInput(
                    'PRICE PER QUANTITY    :', priceController),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title:const Text(
                      'Select Your Order Type:',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Pre_order_and_daily_order('Pre Order'),
                        Pre_order_and_daily_order('Daily Order'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isSelectedBannanaLeaf,
                        onChanged: (value) {
                          setState(() {
                            isSelectedBannanaLeaf = value!;
                            isSelectedContainer = !value;
                            if (!value) {
                              selectedSize = '';
                            }
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      const Text('Bannana Leaf'),
                      Checkbox(
                        value: isSelectedContainer,
                        onChanged: (value) {
                          setState(() {
                            isSelectedContainer = value!;
                            isSelectedBannanaLeaf = !value;
                            if (!value) {
                              selectedSize = '';
                            }
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      const Text('Container'),
                    ],
                  ),
                ),
                if (isSelectedBannanaLeaf)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        buildRadioListTile('Small', 'Small'),
                        buildRadioListTile('Medium', 'Medium'),
                        buildRadioListTile('Large', 'Large'),
                      ],
                    ),
                  ),
                if (isSelectedContainer)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        buildRadioListTile('100 ml', '100ml'),
                        buildRadioListTile('250 ml', '250ml'),
                        buildRadioListTile('500 ml', '500ml'),
                        buildRadioListTile('750 ml', '750ml'),
                      ],
                    ),
                  ),
                if(selectedimage != null)
                  Center(child: SizedBox(
                      height: 100,
                      width: 200,
                      child: Image.file(selectedimage!,fit: BoxFit.cover,scale: 10,))),
                const SizedBox(height: 10,),
                Center(
                  child: TextButton(
                    onPressed:(){
                      _pickImage();
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(const Size(300, 40)),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                    ),

                    child: const Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                /*  Center(
                  child: TextButton(
                    onPressed:(){
                      _pickImage();
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(300, 40)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    ),

                    child: Text(
                      'Upload Video',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),*/
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            fixedSize: const Size(100, 40),
                          ),
                          onPressed: _saveData,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Center(
                        child: TextButton(
                          onPressed: (){
                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(const BorderSide(color: Colors.red)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioListTile(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: selectedSize,
      onChanged: (newValue) {
        setState(() {
          selectedSize = newValue as String;
        });
      },
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
          activeColor: Colors.blue,
        ),
        Text(label),
      ],
    );
  }

  Widget Pre_order_and_daily_order(String label) {
    return Row(
      children: [
        Radio(
          value: label,
          groupValue: selectedPreOrderDailyorder,
          onChanged: (value) {
            setState(() {
              selectedPreOrderDailyorder = value.toString();
            });
          },
          activeColor: Colors.blue,
        ),
        Text(label),
      ],
    );
  }
  Widget buildQuantityInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 80,
            width: 70,
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Estimate Quantity';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '0',
                hintStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildQuantityPriceInput(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 80,
          width: 70,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Price Pre Quantity';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'RS .00',
              hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}