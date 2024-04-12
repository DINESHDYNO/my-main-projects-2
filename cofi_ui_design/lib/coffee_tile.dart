import 'package:cofi_ui_design/coffedeatilspage.dart';
import 'package:cofi_ui_design/main.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProducDetailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10,top: 10,),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(3, 5),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          width: size.width / 2 - 20,
          padding: EdgeInsets.all(7),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(imageUrl),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: 20,
                          width: 43,
                          decoration: BoxDecoration(
                              color: Color(0xFFCF9F69).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(9)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 3,),
                              Icon(Icons.star,color: Colors.white,size:15,),
                              Text('5.2',style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\$'+price,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  child: Icon(Icons.add),
                ),
              ),
              /*Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.secondaryColor.withOpacity(.8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.white),
                      Text(
                        '4.5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
