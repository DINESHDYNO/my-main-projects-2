import 'package:flutter/material.dart';

class fitterfoodtesting {
  const fitterfoodtesting({
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
    required this.vegNon,
  });

  final String image;
  final String title;
  final int quantity;
  final int price;
  final String vegNon;

  static List<fitterfoodtesting> filtterfooditems() {
    return  [
      const fitterfoodtesting(
        image: 'assets/images/food1.jpg',
        title: 'Breakfast Expresss',
        quantity: 3,
        price: 140,
        vegNon: 'veg',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food2.jpg',
        title: 'Pizza Corner',
        quantity: 1,
        price: 160,
        vegNon: 'veg',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food3.jpg',
        title: 'BBQ King',
        quantity: 2,
        price: 230,
        vegNon: 'non veg',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food4.jpg',
        title: 'Sea Emperor',
        quantity: 6,
        price: 30,
        vegNon: 'non veg',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food5.jpg',
        title: 'Chai Truck',
        quantity: 4,
        price: 10,
        vegNon: 'veg&non',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food8.jpg',
        title: 'Thalappakatti',
        quantity: 1,
        price: 130,
        vegNon: 'veg&non',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food9.jpg',
        title: 'Eat & Meet',
        quantity: 6,
        price: 200,
        vegNon: 'non veg',
      ),
      const fitterfoodtesting(
        image: 'assets/images/food6.jpg',
        title: 'Anjapar Restaurant',
        quantity: 4,
        price: 190,
        vegNon: 'veg',
      ),
    ];
  }
}

class filtterfoods extends StatefulWidget {
  @override
  State<filtterfoods> createState() => _filtterfoodsState();
}

class _filtterfoodsState extends State<filtterfoods> {
  List<String> categories = ['veg', 'non veg', 'veg&non'];
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final filtterproducts = fitterfoodtesting.filtterfooditems()
        .where((product) =>
    selectedCategories.isEmpty ||
        selectedCategories.contains(product.vegNon))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Filter Option',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 19,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                // margin: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InputChip(
                          label: Text(category,style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.black,
                          ),),
                          selected: selectedCategories.contains(category),
                          onPressed: () {
                            setState(() {
                              if (selectedCategories.contains(category)) {
                                selectedCategories.remove(category);
                              } else {
                                selectedCategories.add(category);
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              color: Colors.red.shade600,
                              width: 1.3,
                            ),
                          ),
                          backgroundColor: selectedCategories.contains(category)
                              ? Colors.red.shade200 // Adjust the color for selected state
                              : Colors.transparent, // Adjust the color for unselected state
                          labelStyle: TextStyle(
                            color: selectedCategories.contains(category) ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filtterproducts.length,
                  itemBuilder: (context, index) {
                    final product = filtterproducts[index];
                    return Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(product.image),fit: BoxFit.fill
                              )
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          title: Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Price: \$${product.price}, Quantity: ${product.quantity}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
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
