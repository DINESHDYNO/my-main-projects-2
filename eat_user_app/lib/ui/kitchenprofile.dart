import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';

class kitchenprofile extends StatefulWidget {
  const kitchenprofile({super.key});

  @override
  State<kitchenprofile> createState() => _kitchenprofileState();
}

class _kitchenprofileState extends State<kitchenprofile>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 5, vsync: this);
  late String currentMonth;

  int currentindex = 0;
  bool pureVegClicked = false;
  bool nonVegClicked = false;
  bool hotSalesClicked = false;
  List<String> foodtime = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Dinner',
    'Beverage'
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    pureVegClicked = false;
    nonVegClicked = false;
    hotSalesClicked = false;
    getCurrentMonth();
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      getCurrentMonth();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void getCurrentMonth() {
    final now = DateTime.now();
    currentMonth = "${_getMonthName(now.month)} ${now.year}";
    setState(() {});
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }

  String _getImageAsset(int index) {
    switch (index) {
      case 0:
        return 'assets/images/sunrise.png';
      case 1:
        return 'assets/images/sun.png';
      case 2:
        return 'assets/images/sun1.png';
      case 3:
        return 'assets/images/moon.png';
      default:
        return 'assets/images/juice.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: foodtime.length,
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/indian-condiments-with-copy-space-view-min.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.11,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.11,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.share,
                                    size: 23,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 37,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 100,
                left: 2,
                right: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: size.height * 0.23,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(2, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: size.width * 0.17,
                              height: size.height * 0.08,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/indian-condiments-with-copy-space-view-min.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'KUMARI KICHEN',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Diabetic Friendly | South indian',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'BP Friendly | Protein Rich | Protein Rich | Com...',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Vegetarian.png',
                              scale: 3.5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Veg',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/images/Non Vegetarian.png',
                              scale: 3.5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Non Veg',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.local_offer,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '₹99 - ₹399 |',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.green[700],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '2 km',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: size.height * 0.024,
                                width: size.width * 0.1,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '4.8',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Reviews(23)',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('KITCHEN - HEART OF THE HOME')
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 390,
                left: 2,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(2, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    currentMonth,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.2,
                                        color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 50,
                            itemBuilder: (BuildContext context, int index) {
                              DateTime currentDate =
                                  DateTime.now().add(Duration(days: index));
                              String formattedDate = "${currentDate.day}";
                              String formattedMonth =
                                  DateFormat('MMM').format(currentDate);
                              String formattedWeekday =
                                  DateFormat('EEE').format(currentDate);

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 65,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 3,
                                              blurRadius: 4,
                                              offset: Offset(2, 3),
                                            ),
                                          ],
                                          color: selectedIndex == index
                                              ? Colors.orange
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              formattedMonth,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              formattedDate,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22,
                                                color: selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              formattedWeekday,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildContainer(
                              context,
                              'Pure Veg',
                              size,
                              () {
                                if (!pureVegClicked) {
                                  setState(() {
                                    pureVegClicked = true;
                                    nonVegClicked = false;
                                    hotSalesClicked = false;
                                  });
                                } else {
                                  // If Pure Veg is clicked again, do nothing (optional).
                                  // You can add your logic here if needed.
                                }
                              },
                              'assets/images/plant.png',
                              pureVegClicked ? Color(0xFFcfffc8) : Colors.white,
                            ),
                            buildContainer(
                              context,
                              'Non Veg',
                              size,
                              () {
                                if (!nonVegClicked) {
                                  setState(() {
                                    nonVegClicked = true;
                                    pureVegClicked = false;
                                    hotSalesClicked = false;
                                  });
                                }
                              },
                              'assets/images/chicken-leg.png',
                              nonVegClicked ? Color(0xFFffc08d) : Colors.white,
                            ),
                            buildContainer(
                              context,
                              'Hot Sales',
                              size,
                              () {
                                if (!hotSalesClicked) {
                                  setState(() {
                                    hotSalesClicked = true;
                                    pureVegClicked = false;
                                    nonVegClicked = false;
                                    pureVegClicked ? Colors.red : Colors.white;
                                  });
                                }
                              },
                              'assets/images/fire.png',
                              hotSalesClicked
                                  ? Color(0xFFff9696)
                                  : Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TabBar(
                              controller: tabController,
                              isScrollable: true,
                              tabs: foodtime
                                  .asMap()
                                  .entries
                                  .map((MapEntry<int, String> entry) {
                                return Tab(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(width: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            _getImageAsset(entry.key),
                                            height: 23,
                                            width: 23,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(entry.value),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onTap: (value) {
                                currentindex = value;
                              },
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorWeight: 3.0,
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              unselectedLabelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 4,
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Biriyani Rice',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/Non Vegetarian.png',
                                          scale: 3.5,
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          height: size.height * 0.024,
                                          width: size.width * 0.1,
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'New',
                                                style: TextStyle(color: Colors.white),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "1KG Veg Biriyani,\n50 Grams of Onion,\n100 Grams of Bread Halwa..",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Price: ₹150',style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: size.height*0.13,
                                      width: size.width*0.33,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/food.jpg'),
                                          fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: size.height*0.035,
                                      width: size.width*0.16,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow[700],
                                          borderRadius: BorderRadius.circular(10)
                                      ),child: Center(child: Text('ADD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}

Widget buildContainer(
  BuildContext context,
  String foodType,
  Size size,
  VoidCallback onPressed,
  String image,
  Color backgroundColor,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.040,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            width: 0.4,
            color: Colors.black.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 23,
                width: 23,
              ),
              SizedBox(width: 5),
              Text(
                foodType,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
