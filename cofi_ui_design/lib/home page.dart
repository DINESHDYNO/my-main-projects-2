import 'package:cofi_ui_design/coffee_tile.dart';
import 'package:cofi_ui_design/coffee_type.dart';
import 'package:cofi_ui_design/main.dart';
import 'package:cofi_ui_design/specialoffercard.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  FocusNode searchFocusNode = FocusNode();

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/kumar3.png'),
                      ),
                    ),
                    const Icon(
                      Icons.notifications_active_outlined,
                      color: cbrown,
                      size: 32,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Good evening, Dinesh',
                      style: TextStyle(
                          fontSize: 24, fontWeight: cfont, color: cbrown),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        focusNode: FocusNode(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: cbrown,
                              size: 22,
                            ),
                            suffixIcon: Icon(
                              Icons.filter_alt_sharp,
                              color: Color(0xFF10542F),
                              size: 22,
                            ),
                            suffixIconConstraints: BoxConstraints(
                              maxHeight: 20,
                              minWidth: 35,
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 20, minWidth: 35),
                            border: InputBorder.none,
                            hintText: 'Search Coffee...',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: cbrown,
                          fontSize: 24),
                    ),
                  )
                ],
              ),
              Container(
                height: 50,
                child: const coffeetype(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: 280,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                          imageUrl: 'assets/images/im7.jpg',
                          title: 'Cappuccino',
                          subtitle: 'Without sugar',
                          price: ' 5.12'),
                      const SizedBox(
                        width: 20,
                      ),
                      ProductCard(
                          imageUrl: 'assets/images/im2.jpg',
                          title: 'Cappuccino',
                          subtitle: 'Without sugar',
                          price: ' 5.12'),
                      const SizedBox(
                        width: 20,
                      ),
                      ProductCard(
                          imageUrl: 'assets/images/im0.jpg',
                          title: 'Cappuccino',
                          subtitle: 'Without sugar',
                          price: ' 5.12'),
                      const SizedBox(
                        width: 20,
                      ),
                      ProductCard(
                          imageUrl: 'assets/images/im4.jpg',
                          title: 'Cappuccino',
                          subtitle: 'Without sugar',
                          price: ' 5.12'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Special Offer 🔥',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 21,
                              color: cbrown),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: (){},
                      highlightColor:Colors.brown,
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: cbrown),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SpecialOfferCard(
                        imageUrl: 'assets/images/im4.jpg',
                        title: 'Discover',
                        subtitle:
                            'Get three cups of tea for free when you register.'),
                    SpecialOfferCard(
                        imageUrl: 'assets/images/im0.jpg',
                        title: 'Discover',
                        subtitle:
                            'Get three cups of tea for free when you register.'),
                    SpecialOfferCard(
                        imageUrl: 'assets/images/im2.jpg',
                        title: 'Discover',
                        subtitle:
                            'Get three cups of tea for free when you register.'),
                    SpecialOfferCard(
                        imageUrl: 'assets/images/im3.jpg',
                        title: 'Discover',
                        subtitle:
                            'Get three cups of tea for free when you register.'),
                    SpecialOfferCard(
                        imageUrl: 'assets/images/im4.jpg',
                        title: 'Discover',
                        subtitle:
                            'Get three cups of tea for free when you register.')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
