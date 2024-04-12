
import 'package:cofi_ui_design/SizeListSection.dart';
import 'package:cofi_ui_design/main.dart';
import 'package:flutter/material.dart';

class ProducDetailsScreen extends StatefulWidget {
  const ProducDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProducDetailsScreen> createState() => _ProducDetailsScreenState();
}

class _ProducDetailsScreenState extends State<ProducDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = true;

    void toggleIcon() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Image.asset(
              'assets/images/im6.jpg',
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover),
          Positioned(
            top: 380,
            right: 20,
            child: Container(
              height: 30,
              width: 53,
              decoration: BoxDecoration(
                  color: Color(0xFFCF9F69).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(13)
              ),
              child: Row(
                children: [
                  SizedBox(width: 6,),
                  Icon(Icons.star,color: Colors.white,size:16,),
                  Text('5.2',style: TextStyle(color: Colors.white,fontSize: 17),)
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder: (context, controller) {
                return Container(
                  child: ListView(
                    controller: controller,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        alignment: Alignment.center,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: const Offset(3, 5),
                              ),
                            ],
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Coffee',
                                style: TextStyle(
                                    color: cbrown,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                color: Colors.black45,
                              ),
                            ),
                            Text('Chocolate',
                                style: TextStyle(
                                    color: cbrown,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                color: Colors.black45,
                              ),
                            ),
                            Text('Milk',
                                style: TextStyle(
                                    color: cbrown,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 20, bottom: 10),
                        child: Text("Coffee size",
                            style: TextStyle(
                                color: cbrown,
                                fontWeight: FontWeight.w700,
                                fontSize: 22)),
                      ),
                      const CategoryItem(),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          top: 10,
                        ),
                        child: Text("About",
                            style: TextStyle(
                                color: cbrown,
                                fontWeight: FontWeight.w700,
                                fontSize: 22)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, top: 10, bottom: 10, right: 30),
                        child: Text(
                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups...",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      SizedBox(height: 8,),
                      const AddToCartCard(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                );
              }),
            Positioned(
              top: 25,
              right: 15,
              child: GestureDetector(
                onTap: toggleIcon,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              )
            ),
          Positioned(
            top: 25,
            left: 15,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child:  CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
