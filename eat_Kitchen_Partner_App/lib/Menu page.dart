import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'RecipeDataProvider.dart';
import 'add items.dart';


class Menu_page extends StatefulWidget {

  @override
  State<Menu_page> createState() => _Menu_pageState();
}

class _Menu_pageState extends State<Menu_page> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    List<String> foodtime = ['MEALS', 'NON MEALS'];
    return DefaultTabController(
      length: foodtime.length,
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
              onPressed: () {
                _showMyDialog(context);
              },
              child: Image.asset(
                'assets/images/discount.png',
                height: 30,
                width: 30,
              ),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddItems()));
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'SCHEDULE MENU',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 23,
                    wordSpacing: 5,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/imagebsckround.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      DateTime currentDate = now.add(Duration(days: index));
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
                                  selectedIndex =
                                      index; // Toggle the selected state
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 65,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.orange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  tabs: foodtime.map((String tab) {
                    return Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8),
                          Text(tab),
                        ],
                      ),
                    );
                  }).toList(),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [Veg_items(), NonVeg_items()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Veg_items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeDataProvider>(
      builder: (context, recipeProvider, child) {
        RecipeData recipeData = recipeProvider.recipeData;
        return Scaffold(
          body: Center(
            child: Text('Recipe Name: ${recipeData.name}'),
          ),
        );
      },
    );
  }
}

class NonVeg_items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> fooditemsname = [
      'Idli and Sambhar',
      'Dosa Chutney',
      'Onion Tomato Uttapam',
      'Pongal with chutney',
      'sambar',
      'vada',
      'Vada sambar chutney',
      'Milagai Bajji',
      'Biryani',
      'Pista Kulfi'
    ];
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, int index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      title: Text(
                        fooditemsname[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/download.jpeg',
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/writing.png',
                                height: 25,
                                width: 25,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Offer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Flat/Percentage',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'item 1',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '________/_________',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'item 2',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '________/_________',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'item 3',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '________/_________',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Apply',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}



