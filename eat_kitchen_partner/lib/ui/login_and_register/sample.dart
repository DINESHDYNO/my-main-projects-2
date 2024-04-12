import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.settings,
    Icons.account_circle,
  ];

  List<String> textList = [
    "Home",
    "Favorite",
    "Settings",
    "Profile",
  ];
  List<String> prices = [
    "\$ 1000",
    "\$ 5444",
    "\$ 2.994",
    "\$ 15444",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.grey.shade300,
          title: Row(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            Container(
              height: 40,
              width: 230,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.person_rounded,
              color: Colors.black,
              size: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            const Badge(
              label: Text('1'),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Badge(
              label: Text('9+'),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height /12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Dashboard ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                    Container(
                        height :140,
                        width :140,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,size: 15,color: Colors.green,),
                            SizedBox(width: 15,),
                            Text("Dashboard ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),


                          ],
                        )),
                    Text("Dashboard ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                    Text("Dashboard ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),              SizedBox(height: 20),
              Container(
                height: size.width * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: iconList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: size.width * 0.36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Icon(iconList[index]), // Icon
                            SizedBox(height: 10),
                            Text(textList[index]),
                            SizedBox(height: 10),
                            Text(prices[index], style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Order', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
              ),
              Container(
                height: size.width * 0.3 * iconList.length, // Adjust height based on content and device size
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: iconList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ASK-EST -005'),
                                  SizedBox(height: 10),
                                  Text('Mar 28, 2023'),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('\$35.00', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10),
                                Text('\$15.00'),
                              ],
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
