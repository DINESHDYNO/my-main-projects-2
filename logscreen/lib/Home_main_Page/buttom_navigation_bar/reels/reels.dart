import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              width:size.width,
              height: size.height,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: Container(
                      height: size.height*0.9,
                      width: size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.5)
                        /*, image: DecorationImage( image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk_2qFQ6DcSN5JZgt7oQu64w4cvznN_lXbQQ&usqp=CAU'),fit: BoxFit.cover
                        ) ,*/
                      ),

                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0,380.0),
                              height: 80,
                              width: 50,
                             // child: CircleAvatar(backgroundImage: AssetImage('../assets/ben.jpg'),radius: 100,),

                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(

                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 380.0),
                                child: Text('Reels',style: TextStyle(fontSize: 20,color: Colors.black,
                                    fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(90.0, 120.0, 0.0, 0.0),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [


                                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up,color: Colors.black,)),
                                  SizedBox(height: 20,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down,color:Colors.black,)),
                                  SizedBox(height: 20,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: Colors.black,)),
                                  SizedBox(height: 20,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.black,)),
                                  SizedBox(height: 30,),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_sharp)),
                                ],
                              ) ,)
                          ],
                        ),
                      ),


                    ),

                  ),

                ],
              ),

            ),


          ),
        ],
      ),
    );

  }
}