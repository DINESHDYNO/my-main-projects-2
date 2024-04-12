import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../ApiProvider.dart';
import '../../../apimodel.dart';
import 'CacheSharedPrefrecence.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final CacheService _cacheService = CacheService();
  final YourDataProvider _dataProvider = YourDataProvider(); // Initialize your data provider
  bool _dataLoaded = false;

  @override
  void initState() {
    super.initState();
    // Fetch data only if it hasn't been loaded before
    if (!_dataLoaded) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    try {
      await _dataProvider.fetchData();
      setState(() {
        _dataLoaded = true;
        print(_dataLoaded);
      });
    } catch (error) {
      // Handle error, show a message or retry logic
      print('Error fetching data: $error');
      setState(() {
        _dataLoaded = true;// Set _dataLoaded to true even in case of an error to avoid infinite loading
      });
    }
  }

/*  @override
  void dispose() {
    // Clear cache when the app is closed
    _cacheService.clearCache();
    super.dispose();
  }*/

  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return _dataLoaded
                ? buildContent() // Display content only when data is loaded
                : Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }*/
  Widget build(BuildContext context) {
    if (!_dataLoaded) {
      return Center(child: CircularProgressIndicator()); // Show the indicator while data is loading
    } else {
      return buildContent(); // Display your data once it's loaded
    }
  }

  Widget buildContent() {
    return Column(
      children: [
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _dataProvider.appSliderImages.length,
              itemBuilder: (BuildContext context, int index) {
                AppSlider appSliderImage = _dataProvider.appSliderImages[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: appSliderImage.image ?? '',
                      fit: BoxFit.fill,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _dataProvider.listofKitchens.length,
            itemBuilder: (BuildContext context, int index) {
              ListofKitchens kitchen = _dataProvider.listofKitchens[index];
              return Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 1,
                  vertical: 8.0,
                ),
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
                                key: ValueKey('${kitchen.kitchenpic}'),
                                imageUrl: '${kitchen.kitchenpic}',
                                fit: BoxFit.fill,
                                cacheKey: '${kitchen.kitchenpic}',
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
                                    '${kitchen.kname}',
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
                                          '${kitchen.city}',
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
                                      color: Colors.black,
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
    );
  }
}
