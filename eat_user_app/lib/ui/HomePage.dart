import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

//import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../APIProvider.dart';
import '../Datamodel.dart';
import '../constant.dart';
import 'BreakfastTabBarView.dart';
import 'BreakfstTabbar2model.dart';
import 'HomeScreenWidgets/loactionand.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 5, vsync: this);
  int currentindex = 0;
  bool pureVegClicked = false;
  bool nonVegClicked = false;
  bool hotSalesClicked = false;
  bool isLoading = true;
  List<AppSlider> appSliderImages = <AppSlider>[];

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

  List<String> foodtime = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Dinner',
    'Beverage'
  ];
  List<String> foodtype = [
    'Pure Veg',
    'Non Veg',
    'Hot sales',
  ];



  @override
  void initState() {
    super.initState();
    pureVegClicked = false;
    nonVegClicked = false;
    hotSalesClicked = false;
   // loadData();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<YourDataProvider>();
    Size size = MediaQuery.of(context).size;
    // Color color = kPrimaryColor;
    return SafeArea(
      child: FutureBuilder(
          future: context.read<YourDataProvider>().fetchData(),
          builder: (context, snapshot) {
           /* if(snapshot.connectionState == ConnectionState.waiting) {
              // Loading indicator
              return Center(child: CircularProgressIndicator());
            } else*/ if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading data'),
              );
            } else {
              return Scaffold(
                backgroundColor: const Color(0xFFffffff),
                body: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: DefaultTabController(
                    length: foodtime.length,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const LocationWidget(),
                          thiruvalluvartext(size: size),
                          const SizedBox(
                            height: 7,
                          ),
                          const searchbox(),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            child: CarouselSlider.builder(
                              itemCount: dataProvider.appSliderImages.length,
                              itemBuilder: (context, index, realIndex) {
                                // Ensure the index is within bounds
                                if (index >= 0 &&
                                    index < dataProvider.appSliderImages.length) {
                                  AppSlider appSlider =
                                  dataProvider.appSliderImages[index];
                                  return CachedNetworkImage(
                                    key: UniqueKey(),
                                    cacheKey: '${appSlider.image}',
                                    imageUrl: '${appSlider.image}',
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  );
                                } else {
                                  // Handle the case where the index is out of bounds
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                              options: CarouselOptions(
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  currentindex = index;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: dataProvider.appSliderImages
                                .asMap()
                                .entries
                                .map((entry) {
                              int index = entry.key;
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 2.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentindex == index
                                      ? Colors.deepOrange
                                      : Colors.grey[300],
                                ),
                              );
                            }).toList(),
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
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      'PRODUCTS',
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: SizedBox(
                              height: size.height * 0.13,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: size.width * 0.18,
                                        height: size.width * 0.18,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF009245),
                                              Color(0xFFFCEE21)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        // Add any child widget or content inside the circular container if needed
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          ' Products ${index + 1}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                pureVegClicked
                                    ? const Color(0xFFcfffc8)
                                    : Colors.white,
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
                                nonVegClicked
                                    ? const Color(0xFFffc08d)
                                    : Colors.white,
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
                                      pureVegClicked
                                          ? Colors.red
                                          : Colors.white;
                                    });
                                  }
                                },
                                'assets/images/fire.png',
                                hotSalesClicked
                                    ? const Color(0xFFff9696)
                                    : Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ExpansionTile(
                                iconColor: kPrimaryColor,
                                collapsedBackgroundColor: Colors.grey.shade200,
                                title: const Text(
                                  'Pre-Booking',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                tilePadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: SizedBox(
                                      height: size.height * 0.25,
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            width: size.width * 0.4,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                              color: Colors.white,
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFF89ffa5),
                                                  Color(0xFFc8ff6b),
                                                  Color(0xFFe3ffe6)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  height: size.height * 0.12,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/images/food.jpg'))),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        bottom: 10,
                                                        right: 0,
                                                        child: Container(
                                                          height: size.height *
                                                              0.022,
                                                          width: size.width *
                                                              0.250,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                            ),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            'Only 10 Left',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[700],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Bonda',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17),
                                                          ),
                                                          Text(
                                                            'Abi kitchen',
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17),
                                                          ),
                                                          Text(
                                                            'Chennai',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
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
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                        const SizedBox(width: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              _getImageAsset(entry.key),
                                              height: 23,
                                              width: 23,
                                            ),
                                            const SizedBox(
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
                          const SizedBox(
                            height: 20,
                          ),
                          /*SizedBox(
                   height: 1000,
                   child: TabBarView(
                     controller: tabController,
                     children: const [
                       Breakfast(),
                       Lunch(),
                       Breakfast(),
                       Breakfast(),
                       Breakfast(),
                     ],
                   ),
                 ),*/
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10,),
                              Text(
                                'AVAILABLE KITCHENS NEARBY',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          /*Column(
                            children: List.generate(
                              dataProvider.listofKitchens.length,
                              (index) {
                                ListofKitchens Listofkitchens =
                                    dataProvider.listofKitchens[index];

                                return Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 8.0),
                                  child: Stack(
                                    children: [
                                      Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    child: Image(
                                                      image: CachedNetworkImageProvider(
                                                          '${Listofkitchens.kitchenpic}'),
                                                      fit: BoxFit.fill,
                                                      loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        } else {
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        }
                                                      },
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return const Icon(
                                                            Icons.error);
                                                      },
                                                    ))),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${Listofkitchens.kname}',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.location_on),
                                                        Expanded(
                                                          child: Text(
                                                            '${Listofkitchens.city}',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 22,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            '4.4',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.pink,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
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
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
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
              const SizedBox(width: 5),
              Text(
                foodType,
                style: const TextStyle(
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

Widget foodtimings(BuildContext context, String foodtiming, Size size,
    VoidCallback? onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.045,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
          border: Border.all(width: 0.5, color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            foodtiming,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 8,
            ),
          ),
        ),
      ),
    ),
  );
}
