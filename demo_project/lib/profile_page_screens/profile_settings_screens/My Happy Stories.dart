import 'package:demo_project/constant/Constant.dart';
import 'package:flutter/material.dart';

class MyHappyStories extends StatelessWidget {
  const MyHappyStories({super.key});

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
            "My Happy Stories",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 20,),
          Text("Add Success Story",style: TextStyle(color: primaryColor,fontSize: 20),),
          SizedBox(height: 10,),
          Text("Upload Your Successfully Story Or Interesting Feedback",style: TextStyle(color: Color(0xffA4A4A4),fontFamily: "SFPRODISPLAYMEDIUM"),),
          SizedBox(height: 20,),
          Text("Message",style: TextStyle(fontSize: 15,color: primaryColor),),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(),
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1)
            ),child: TextFormField(
            decoration:  InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "Write Message",
                hintStyle: TextStyle(color: const Color(0xff080808).withOpacity(0.5,),fontSize: 16,fontFamily: "SFPRODISPLAYMEDIUM"),
                border: InputBorder.none
            ),
            minLines: 3,
            maxLines: 5,

          ),
          ),
          SizedBox(height: 20,),
          Text("Message",style: TextStyle(fontSize: 15,color: primaryColor),),
          SizedBox(height: 20,),
          Container(
            alignment:Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1)
            ),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Success full story.jpeg',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: const Color(0xCB1F2C0F),fontSize: 16,fontFamily: "SFPRODISPLAYMEDIUM"),)),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:  const BorderSide(
                        color: Color(0xFFED2E47),
                        width: 1.0,
                      ),
                    ),
                    elevation: 0,
                    primary: primaryColor?.withOpacity(0.15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text('Upload',style: TextStyle(fontSize: 14,color: primaryColor),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
