import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';


class IgnoredUser extends StatelessWidget {
  const IgnoredUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
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
            "Ignored User",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,i){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 179,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 8,
                          offset: const Offset(3, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: double.infinity,
                          width: 132,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/58.png'), fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              topLeft: Radius.circular(18),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(18),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset("assets/images/86.png", scale: 3),
                                      Image.asset("assets/images/113.png", scale: 2.5)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Christiana John", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('25 Years', style: TextStyle(fontSize: 16, color: Color(0xff8D8D8D),fontFamily: "SFPRODISPLAYMEDIUM"),overflow: TextOverflow.ellipsis,),
                                  SizedBox(width: 50),
                                  Expanded(child: Text('Chennai', style: TextStyle(fontSize: 16, color: Color(0xff8D8D8D),fontFamily: "SFPRODISPLAYMEDIUM"),overflow: TextOverflow.ellipsis,)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Christian', style: TextStyle(fontSize: 16, color: Color(0xff8D8D8D),fontFamily: "SFPRODISPLAYMEDIUM"),overflow: TextOverflow.ellipsis,),
                                  SizedBox(width: 50),
                                  Expanded(child: Text('Tamil', style: TextStyle(fontSize: 16, color: Color(0xff8D8D8D),fontFamily: "SFPRODISPLAYMEDIUM"),overflow: TextOverflow.ellipsis,)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
