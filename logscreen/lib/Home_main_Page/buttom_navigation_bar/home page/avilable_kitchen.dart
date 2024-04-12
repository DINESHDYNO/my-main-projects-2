import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvailableKitchen extends StatelessWidget {
  const AvailableKitchen({
    required this.color,
    required this.foodimage,
    required this.title,
    required this.price,
    required this.location,
  });

  final Color color;
  final String foodimage;
  final String title;
  final String location;
  final String price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 160,
      width: size.width,
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
                  width: size.width * 0.4, // Adjusted width
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: foodimage,
                    fit: BoxFit.fill,
                    cacheKey: foodimage,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
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
                                location,
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
  }
}
