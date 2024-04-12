import 'package:eat_user_app/constant.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<FoodItem> foodItems = [
    FoodItem(
      kitchenName: 'Kirsh Kitchen',
      cuisineType: 'South Indian',
      rating: 4.8,
      priceRange: '₹99 - ₹799',
      image:  'assets/images/indian-condiments-with-copy-space-view-min.jpg'
    ),
    FoodItem(
      kitchenName: 'Rani Kitchen',
      cuisineType: 'South Indian',
      rating: 4.8,
      priceRange: '₹199 - ₹999',
      image:  'assets/images/ingredients-pasta-black.jpg'
    ),
    FoodItem(
      kitchenName: 'Kumari Kitchen',
      cuisineType: 'South Indian',
      rating: 4.8,
      priceRange: '₹59 - ₹899',
      image:  'assets/images/depositphotos_51182341-stock-illustration-south-indian-meal-for-onam.jpg'
    ),
    FoodItem(
      kitchenName: 'Rani Kitchen',
      cuisineType: 'South Indian',
      rating: 4.8,
      priceRange: '₹99 - ₹699',
      image:  'assets/images/indian-condiments-with-copy-space-view-min.jpg'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favourite Kitchen',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    Icon(Icons.favorite,color: Colors.pink,)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    FoodItem item = foodItems[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              child: Image.asset(
                               item.image,
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/woman.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.kitchenName,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.favorite_outlined, color: Colors.pink),
                                                SizedBox(width: 20),
                                                Container(
                                                  height: 24,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: kPrimaryColor, // Change color as needed
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        item.rating.toString(),
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
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.cuisineType,
                                              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.local_offer,
                                                  color: Colors.yellow.shade700,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  item.priceRange,
                                                  style: TextStyle(color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
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
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItem {
  final String kitchenName;
  final String cuisineType;
  final double rating;
  final String priceRange;
  final String image;

  FoodItem(
   {
    required this.kitchenName,
    required this.image,
    required this.cuisineType,
    required this.rating,
    required this.priceRange,
  });
}
