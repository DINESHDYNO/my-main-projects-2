import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:logscreen/Home_main_Page/buttom_navigation_bar/home%20page/searchbox.dart';
import 'package:logscreen/ApiProvider.dart';
import 'package:logscreen/apimodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'avilable_kitchen.dart';
import 'breakfast,lunch...dart';
final pageBucket=PageStorageBucket();
class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool isDataLoaded = false;
  static List<Map<String, dynamic>> cachedItems = [];
  static List<String> cachedAppSliderImages = [];
  var items = <Map<String, dynamic>>[].obs;
  var appSliderImages = <String>[].obs;
  bool isLoading = true;
  late CarouselController? _carouselController;

  @override
  void initState() {
    super.initState();
    //_carouselController = CarouselController();
    getUserApi();
  }

  Future<void> getUserApi() async {
    // Set isLoading to true when the operation starts


    final response = await http.post(
      Uri.parse('https://eat.ind.in/api/user/appslider.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = true;
      });
      var responseData = jsonDecode(response.body);

      if (responseData.containsKey("data") && responseData["data"] is Map) {
        var data = responseData["data"];

        if (data.containsKey("App_slider") && data["App_slider"] is List) {
          appSliderImages.value = List<String>.from(
            data["App_slider"].map((slider) => slider["image"]),
          );
          cachedAppSliderImages = List<String>.from(appSliderImages);
        } else {
          print('Invalid or missing App_slider data');
        }

        if (data.containsKey("Listof_Kitchens") &&
            data["Listof_Kitchens"] is List) {
          items.value = List<Map<String, dynamic>>.from(
            data["Listof_Kitchens"],
          );
          cachedItems = List<Map<String, dynamic>>.from(items);
        } else {
          print('Invalid or missing Listof_Kitchens data');
        }
      } else {
        print('Invalid data format');
      }
    } else {
      print('HTTP Error: ${response.statusCode}');
      // You can throw an exception here if you want to propagate the error further.
      // throw Exception('HTTP Error: ${response.statusCode}');
    }

    // Set isLoading to false when the operation completes (regardless of success or failure)
    setState(() {
      isLoading = false;
    });
  }

  int currentindex = 0;


  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<YourDataProvider>();
    Size size = MediaQuery.of(context).size;
    Color color = const Color(0xFF2ecc71);
    return Scaffold(
      backgroundColor: const Color(0xFFf5f6fb),
      body: isLoading
      ? NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification notification) {
            notification.disallowIndicator();
            return false;
          },
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Container(
                      height: size.height * 0.08,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.15,
                                  height: size.width * 0.15,
                                  margin: EdgeInsets.symmetric(horizontal: 9),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(size.width * 0.09),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListTile(
                    title: Container(
                      padding: EdgeInsets.all(5),
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.015,
                                width: size.width * 0.17,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Container(
                                height: size.height * 0.015,
                                width: size.width * 0.57,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Container(
                                height: size.height * 0.015,
                                width: size.width * 0.57,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: size.height * 0.015,
                                    width: size.width * 0.27,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Container(
                                    height: size.height * 0.015,
                                    width: size.width * 0.27,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Add more containers or widgets as needed
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ),
      ):SafeArea(
          child: NotificationListener<OverscrollIndicatorNotification>(
             onNotification: (OverscrollIndicatorNotification notification) {
               notification.disallowIndicator();
               return false;
             },
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading data'),
                  );
                } else {
                  return PageStorage(
                    bucket: pageBucket,
                    child: SingleChildScrollView(
                    //  key: const PageStorageKey<String>('pageOne'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'West Mambalam',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Lake View Road,West Mambalam,Chennai....',
                                          maxLines: 3,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.notification_add_outlined,
                                    color: color,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:10,),
                            Divider(
                              thickness: 1.5,
                              color: Colors.grey[500],
                              height: 0.1,
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 20),
                                Image.asset(
                                  'assets/images/thiruvalluvar.png',
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    width: size.width * 0.65,
                                    margin: const EdgeInsets.all(10),
                                    child: const Text(
                                      "அகர முதல எழுத்தெல்லாம் ஆதி \nபகவன் முதற்றே உலகு...",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              onTap: () {
                                // Handle the tap event and navigate to the next page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Searchboxpage(),
                                  ),
                                );
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child:  SizedBox(
                                        height: 20,
                                        child: VerticalDivider(
                                          width: 5,
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.mic),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                hintText: 'Search favorite item....',
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              child: CarouselSlider.builder(
                                itemCount: appSliderImages.length,
                                itemBuilder: (context, index, realIndex) {
                                  // Ensure the index is within bounds
                                  if (index >= 0 &&
                                      index < appSliderImages.length) {
                                   /* AppSlider appSlider =
                                    dataProvider.appSliderImages[index];*/
                                    return CachedNetworkImage(
                                      key: UniqueKey(),
                                      //cacheKey: '${appSlider.image}',
                                    //  imageUrl: '${appSliderImages}',
                                      imageUrl: appSliderImages[index],
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 15),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    );
                                  } else {
                                    // Handle the case where the index is out of bounds
                                    return Container(); // You can return an empty container or another widget.
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
                              children: appSliderImages.map((appSlider) {
                                int index =
                                appSliderImages.indexOf(appSlider);
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
                                        ? Colors.green
                                        : Colors.grey.shade300,
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 60, child:  breakfast_lunch_dinner()),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'AVAILABLE KITCHENS NEAR YOU',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                           /* Column(
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
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width *
                                                    0.4,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(14),
                                                  child:*//*Image(
                                                    image: CachedNetworkImageProvider(
                                                        '${Listofkitchens.kitchenpic}'),
                                                    fit: BoxFit.fill,
                                                    loadingBuilder: (context, child, loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        return child;
                                                      } else {
                                                        return CircularProgressIndicator();
                                                      }
                                                    },
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Icon(Icons.error);
                                                    },
                                                  )*//*
                                                  CachedNetworkImage(
                                                    key: ValueKey('${Listofkitchens.kitchenpic}'),
                                                    imageUrl: '${Listofkitchens.kitchenpic}',
                                                    fit: BoxFit.fill,
                                                    cacheKey: '${Listofkitchens.kitchenpic}',
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  ),
                                                )

                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${Listofkitchens.kname}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Row(
                                                        children: [
                                                          const Icon(Icons.location_on),
                                                          Expanded(
                                                            child: Text(
                                                              '${Listofkitchens.city}',
                                                              style: const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Container(
                                                        alignment: Alignment.center,
                                                        height: 22,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                          color: color,
                                                          borderRadius:
                                                          BorderRadius.circular(10),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: Colors.white,
                                                              size: 16,
                                                            ),
                                                            Text(
                                                              '4.4',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.white,
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
                            Column(
                              children: List.generate(
                                items.length,
                                    (index) {
                                  Map<String, dynamic> Listofkitchens = items[index];

                                  return Container(
                                    height: 160,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 8.0),
                                    child: Stack(
                                      children: [
                                        Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(14),
                                                  child: CachedNetworkImage(
                                                    key: ValueKey('${Listofkitchens['kitchenpic']}'),
                                                    imageUrl: '${Listofkitchens['kitchenpic']}',
                                                    fit: BoxFit.fill,
                                                    cacheKey: '${Listofkitchens['kitchenpic']}',
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${Listofkitchens['kname']}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Row(
                                                        children: [
                                                          const Icon(Icons.location_on),
                                                          Expanded(
                                                            child: Text(
                                                              '${Listofkitchens['city']}',
                                                              style: const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                              maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Container(
                                                        alignment: Alignment.center,
                                                        height: 22,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                          color: color, // You should define 'color' variable
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: Colors.white,
                                                              size: 16,
                                                            ),
                                                            Text(
                                                              '4.4',
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white,
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
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
    )
    );
  }
}

