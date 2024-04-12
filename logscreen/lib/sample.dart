import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:logscreen/Home_main_Page/buttom_navigation_bar/home%20page/searchbox.dart';
import 'package:logscreen/ApiProvider.dart';
import 'package:logscreen/apimodel.dart';
import 'package:provider/provider.dart';

import 'Home_main_Page/buttom_navigation_bar/home page/breakfast,lunch...dart';


class sample extends StatefulWidget {
  const sample({Key? key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  //static bool isDataLoaded = false;
  /* static List<Map<String, dynamic>> cachedItems = [];
  static List<String> cachedAppSliderImages = [];
  var items = <Map<String, dynamic>>[].obs;
  var appSliderImages = <String>[].obs;*/

  late CarouselController? _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    startAutoPlay();
    fetchDataAndStartAutoPlay();
    // getUserApi();
  }

  /*Future<void> getUserApi() async {
    try {

      final response = await http.post(
        Uri.parse('https://eat.ind.in/api/user/appslider.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
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
      }
    } catch (error) {
      print('Error: $error');
    }

    print('Slider Images: $appSliderImages');
  }*/
  int currentindex = 0;

  void fetchDataAndStartAutoPlay() async {
    final dataProvider = context.read<YourDataProvider>();
    await dataProvider.fetchData(); // Assuming fetchData() loads the data
    startAutoPlay();
  }

  void startAutoPlay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_carouselController != null) {
        final dataProvider = context.read<YourDataProvider>();
        if (currentindex < dataProvider.appSliderImages.length - 1) {
          currentindex++;
        } else {
          currentindex = 0;
        }

        _carouselController!.animateToPage(currentindex);

        startAutoPlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<YourDataProvider>();
    Size size = MediaQuery.of(context).size;
    Color color = Color(0xFF2ecc71);
    return Scaffold(
      backgroundColor: Color(0xFFf5f6fb),
      body: SafeArea(
        child: FutureBuilder(
          future: dataProvider.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error loading data'),
              );
            } else {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: Row(
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
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
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
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey[500],
                      height: 0.1,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/thiruvalluvar.png',
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              width: size.width * 0.65,
                              margin: EdgeInsets.all(10),
                              child: Text(
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
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 7,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        onTap: () {
                          // Handle the tap event and navigate to the next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Searchboxpage(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Container(
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
                                icon: Icon(Icons.mic),
                                color: Colors.black,
                              )
                            ],
                          ),
                          hintText: 'Search favorite item....',
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
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
                              imageUrl: '${appSlider.image}',
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15),
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
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            currentindex = index;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: dataProvider.appSliderImages.map((appSlider) {
                        int index =
                        dataProvider.appSliderImages.indexOf(appSlider);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentindex == index
                                ? Colors.green
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:
                    Container(height: 60, child: breakfast_lunch_dinner()),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
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
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  /*            SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            ListofKitchens Listofkitchens = dataProvider.listofKitchens[index];
                        return AvailableKitchen(
                          color: color,
                          foodimage: '${Listofkitchens.kitchenpic}',
                          title: '${Listofkitchens.kname}',
                          price: '100',
                          location: '${Listofkitchens.city}',
                        );
                      },
                      childCount: dataProvider.listofKitchens.length,
                    ),
                  ),*/
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            ListofKitchens Listofkitchens = dataProvider.listofKitchens[index];

                            return Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
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
                                          child: CachedNetworkImage(
                                            imageUrl: '${Listofkitchens.kitchenpic}',
                                            fit: BoxFit.fill,
                                            cacheKey: '${Listofkitchens.kitchenpic}',
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    color: color,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.white,
                                                        size: 16,
                                                      ),
                                                      Text(
                                                        '4.4',
                                                        style: const TextStyle(
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
                                  Positioned(
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
                          childCount: dataProvider.listofKitchens.length,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
