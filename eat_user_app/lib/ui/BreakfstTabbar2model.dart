import 'package:eat_user_app/ui/kitchenprofile.dart';
import 'package:flutter/material.dart';

class Lunch extends StatefulWidget {
  const Lunch({Key? key}) : super(key: key);

  @override
  State<Lunch> createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>kitchenprofile()));
              },
              child: LunchItem()),
        );
      },
    );
  }
}

class LunchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.20,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/delicious.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' 5% OFF',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            ' UPTO100',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/plant.png',
                              scale: 25,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Pure veg',
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    Text(
                      'Kitchen Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Meals food',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Velachaery',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '30-45 min',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: size.height * 0.005,
                          width: size.width * 0.01,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '2 km',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Price: ₹99.00',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
