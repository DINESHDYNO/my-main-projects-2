import 'package:eat_user_app/constant.dart';
import 'package:flutter/material.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({Key? key}) : super(key: key);

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  Widget buildSection(String title) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: size.height * 1,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.asset(
                            'assets/images/Untitled design-min.png',
                            fit: BoxFit.cover,
                            height: size.height * 0.25,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Food Item $index',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/plant.png',
                                        scale: 23,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: size.height * 0.024,
                                        width: size.width * 0.09,
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                            BorderRadius.circular(6)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '4.8',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 17,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Abi Kitchen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey[600]),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
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
                                        borderRadius:
                                        BorderRadius.circular(30)),
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
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSection('AVAILABLE KITCHENS NEAR YOU'),
      ],
    );
  }
}
