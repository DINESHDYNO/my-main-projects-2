import 'package:flutter/material.dart';
import 'Blogs_detailes.dart';

class Blogs extends StatefulWidget {
   Blogs({Key? key}) : super(key: key);

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  final List<Map<String, String>> items = [
    {
      'title': 'A Secure Way To Find Your Perfect Match',
      'image': 'assets/images/122.png',
      'date': '26 January 2024',
    },
    {
      'title': 'Tips To Build Amicable Relationship With In-Laws',
      'image': 'assets/images/114.png',
      'date': '26 January 2024',
    },
    {
      'title': 'Amazing Tamil Wedding Rituals That Are A Treat To The Eyes',
      'image': 'assets/images/116.png',
      'date': '26 January 2024',
    },
    {
      'title': 'How And Why Indian Marriages Are Overrated?',
      'image': 'assets/images/117.png',
      'date': '26 January 2024',
    },
    {
      'title': 'Five Fun Things Every Couple Should Do After Marriage',
      'image': 'assets/images/115.png',
      'date': '26 January 2024',
    },
    {
      'title': '5 Vital Discussions To Have Before The Big Day!',
      'image': 'assets/images/66.png',
      'date': '26 January 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/38.png",
              color: Colors.black,
              scale: 3,
            ),
          ),
          title: const Text(
            "Blogs",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final data = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogsDetails(images: data['image']!, title: data['title']!, date: data['date']!,),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          data['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/15.png", scale: 3),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            data['date']!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8D8D8D),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
