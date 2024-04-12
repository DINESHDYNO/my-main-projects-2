import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';

class UserGallery extends StatefulWidget {
  const UserGallery({super.key});

  @override
  State<UserGallery> createState() => _UserGalleryState();
}

class _UserGalleryState extends State<UserGallery> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             height: 64,
             width: size.width,
             color: Colors.white,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 GestureDetector(
                   onTap: () {
                     Navigator.pop(context);
                   },
                   child: Image.asset(
                     "assets/images/37.png",
                     scale: 2.8,
                   ),
                 ),
                 const SizedBox(
                   width: 15,
                 ),
                 Image.asset(
                   "assets/images/76.png",
                   scale: 5,
                 ),
                 const SizedBox(
                   width: 10,
                 ),
                 const Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Ramya Kishnan',
                       style: TextStyle(
                           fontWeight: FontWeight.w700,
                           color: Colors.black,
                           fontSize: 24),
                     ),
                     Text(
                       'krish104@gmail.com',
                       style: TextStyle(color: Colors.grey, fontSize: 13,fontFamily: "SFPRODISPLAYREGULAR"),
                     ),
                   ],
                 ),
               ],
             ),
           ),
           Container(
             height: 90,
             decoration: const BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/images/76.png"),
                 fit: BoxFit.cover,
               ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
              ),
            ),child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xFFEE4B5F).withOpacity(0.63),
                        const Color(0xFFEE4B5F).withOpacity(0.63),
                      ],
                    ),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/119.png",scale: 3,),
                              const Text("3",style: TextStyle(color: primaryColor,fontSize: 15),)
                            ],
                          ),
                          ),
                        ),
                        const SizedBox(width: 10), // Add space between containers
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/96.png",scale: 3,),
                               Text("Add Image",style: TextStyle(color: primaryColor,fontSize: 13,fontFamily: "SFPRODISPLAYMEDIUM"),maxLines: 2,overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
           const SizedBox(
             height: 20,
           ),
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Text('Gallery',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(right: 20,bottom: 20),
               child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                 ),
                 itemCount: 10,
                 itemBuilder: (BuildContext context, int index) {
                   return Container(
                     margin: const EdgeInsets.only(top: 20,left: 20),
                     height: 200,
                     width: 160,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       image: DecorationImage(
                         image: AssetImage("assets/images/${index + 52}.png"),
                         fit: BoxFit.cover,
                       ),
                     ),child: Stack(
                     children: [
                       Positioned(
                           top:10,
                           right: 10,
                           child: Container(
                         height: 32,
                         width: 32,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           color: Colors.white
                         ),child: Image.asset("assets/images/97.png"),
                       ))
                     ],
                    ),
                   );
                 },
               ),
             ),
           ),
         ],
       ),
      ),
    );
  }
}
