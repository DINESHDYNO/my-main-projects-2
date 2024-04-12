import 'package:flutter/material.dart';

import '../../constant/Constant.dart';


class HobbiesInterest extends StatelessWidget {
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
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hobbles:",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              hintText: 'Eating',
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
                  const Text("Interest",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              hintText: 'Dancing',
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
                  const Text("Music:",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              hintText: '3 Songs',
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
                  const Text("Sports:",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              hintText: 'Football, Chess',
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
                  const Text("Foods:",style: TextStyle(fontSize: 15,color: primaryColor,fontFamily: "SFPRODISPLAYMEDIUM"),),
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
                              hintText: 'Biriyani',
                              hintStyle: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM")
                          ),
                        ),
                      )
                  ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
