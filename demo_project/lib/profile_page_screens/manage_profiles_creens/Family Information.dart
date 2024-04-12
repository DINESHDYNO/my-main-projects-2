import 'package:flutter/material.dart';

import '../../constant/Constant.dart';


class FamilyInformation extends StatelessWidget {
  const FamilyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
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
          preferredSize: Size.fromHeight(64), // Change the height as needed
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
              "Family Information",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
            ),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Family Value',
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
                        items: [
                        ],
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Family Type',
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Family Status',
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
                  const Text("Native Town/Village",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Chennai',
                              hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
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
                  const Text("Mother Name",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Mother Name',
                              hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
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
                  const Text("Mother's Occupation",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Home Make",
                              hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
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
                  const Text("Father Name",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Father Name',
                              hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
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
                  const Text("Father's Occupation",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Driver',
                              hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'No. Of Brothers',
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
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            items: [],
                            onChanged: (value) {
                            },
                            hint: Text(
                              'No. Of',
                              style: TextStyle(color: Colors.grey[700],fontFamily: "SFPRODISPLAYMEDIUM"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'No. Of Sisters',
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
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            items: [],
                            onChanged: (value) {
                            },
                            hint: Text(
                              'No. Of',
                              style: TextStyle(color: Colors.grey[700],fontFamily: "SFPRODISPLAYMEDIUM"),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Family Income",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15)
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        title: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Family Income',
                            hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
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
                    'About My Family',
                    style: TextStyle(
                        color: primaryColor,fontSize: 15,fontFamily: "SFPRODISPLAYMEDIUM"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(),
                    height: 94,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1)
                    ),child: TextFormField(
                    decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Write About family...",
                        hintStyle: TextStyle(color: const Color(0xff080808).withOpacity(0.5,),fontSize: 16,fontFamily: "SFPRODISPLAYMEDIUM"),
                        border: InputBorder.none
                    ),
                    minLines: 3,
                    maxLines: 5,
                  ),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}
