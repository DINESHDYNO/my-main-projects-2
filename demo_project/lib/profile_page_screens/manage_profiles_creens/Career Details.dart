import 'package:flutter/material.dart';

import '../../constant/Constant.dart';


class CareerDetails extends StatelessWidget {
  const CareerDetails({super.key});

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
              "Career Details",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
            ),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Education',
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
                          'Bsc',
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
                  const Text("Education In Detail",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              border: InputBorder.none
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'If Nothing Is Suitable Others',
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
                    'Employed In*',
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
                          'Private',
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
                    'Occupation',
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
                        onChanged: (value) {},
                        hint: Text(
                          'Sales',
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
                  const Text("Occupation In Detail",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                            hintText: 'Manager',
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
                  const Text("Income / Monthly Salary",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              hintText: ''
                          ),
                        ),
                      )
                     ),
                   ),
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
