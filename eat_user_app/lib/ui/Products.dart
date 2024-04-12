import 'package:flutter/material.dart';

class KitchenSetsPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Mutton-Masala",
      image: 'assets/images/masala.jpg',
      weight: '500 gm',
      kitchenname: "Sara kitchen",
    ),
    Product(
      name: "Verkadalai",
      image: 'assets/images/varkadali.jpeg',
      weight: '1 kg',
      kitchenname: "Tasty Kitchen",
    ),
    Product(
      name: "Batham pistha",
      image: 'assets/images/batham.jpeg',
      weight: '250 gm',
      kitchenname: "Ram Kitchen",
    ),
    Product(
      name: "Organic clove",
      image: 'assets/images/download (1).jpeg',
      weight: '500 gm',
      kitchenname: "Rani Kitchen",
    ),
    Product(
      name: "Idli flour",
      image: 'assets/images/Idli.jpg',
      weight: '3 kg',
      kitchenname: "Kumari Kitchen",
    ),
    Product(
      name: "Nattu akarai 1 kg",
      image: 'assets/images/nattu-sakkarai-cane-sugar-organic.jpg',
      weight: '1 kg',
      kitchenname: "Abi Kitchen",
    ),
    Product(
      name: "Rasam Powder",
      image: 'assets/images/rasampowder.jpg',
      weight: '750 gm',
      kitchenname: "Arasi Kitchen",
    ),
    Product(
      name: "Pepper Masala",
      image: 'assets/images/melagu.jpeg',
      weight: '550 gm',
      kitchenname: "Rethika Kitchen",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification notification){
      notification.disallowIndicator();
      return false;
    }, child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Products',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19,
                    mainAxisSpacing: 19,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
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

class Product {
  final String name;
  final String image;
  final String weight;
  final String kitchenname;

  Product(
      {required this.name,
      required this.image,
      required this.weight,
      required this.kitchenname});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        
        constraints: BoxConstraints(maxHeight: size.height * 0.5),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
             padding: EdgeInsets.all(10),
             height: size.height*0.11,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.white,
               image: DecorationImage(
                 image: AssetImage(product.image),
                 fit: BoxFit.cover
               )
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Image.asset( 'assets/images/Vegetarian.png',scale: 4,)
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('Weight: ${product.weight}'),
                  SizedBox(height: 2),
                  Text(
                    product.kitchenname,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

