import 'package:flutter/material.dart';
import 'package:shopping_order/Tabbar/On-going_order1.dart';

class OrderData {
  final String name;
  final String product;
  final String description;
  final String image;
  final String delivery;

  OrderData(
      { required this.name,
      required this.product,
      required this.description,
      required this.image,
        required this.delivery});
}

class ongoingorder extends StatelessWidget {
  const ongoingorder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderData> orders = [
      OrderData(
        name: 'DINESH DINO',
        product: 'Royal - 20 lit',
        description: '10 Cans | ₹ 400',
        image: 'assets/images/raja.jpg',
        delivery: 'Out for delivery'
      ),
      OrderData(
        name: 'RAM KUMAR',
        product: 'Royal - 20 lit',
        description: '10 Cans | ₹ 400',
        image: 'assets/images/kumar3.png',
          delivery: 'Out for delivery'
      ),
      OrderData(
        name: 'RAJA RAVI',
        product: 'Royal - 20 lit',
        description: '10 Cans | ₹ 400',
        image: 'assets/images/download.jpg',
          delivery: 'On its way'
      ),
      OrderData(
        name: 'KUMAR RAJA',
        product: 'Royal - 20 lit',
        description: '10 Cans | ₹ 400',
        image: 'assets/images/raja1.jpg',
          delivery: 'Out for delivery'
      ),
      OrderData(
        name: 'DILEEP DL',
        product: 'Royal - 20 lit',
        description: '10 Cans | ₹ 400',
        image: 'assets/images/raja2.jpg',
          delivery: 'On its way'
      ),
      OrderData(
        name: 'SARAVANAN',
        product: 'Royal - 20 lit',
        description: '10 Cans | ₹ 400',
        image: 'assets/images/raja3.jpg',
          delivery: 'On its way'
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return InkWell(
                onTap: () {
                  _onItemTap(context, index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 6),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              order.image,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                order.product,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                order.description,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    order.delivery,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,wordSpacing: 3),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void _onItemTap(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ongoingpage1()));
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page2()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page3()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page4()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page5()),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page6()),
      );
      break;
    default:
      break;
  }
}
class ongoingpage1 extends StatelessWidget {
  bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'On-going Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 19,
              right: 15,
            ),
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ], borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/raja.jpg',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11, top: 20),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name of the customer",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Product brand",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Product Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Quantity",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    "Phone number",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 16,
                                        wordSpacing: 4),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ": RAM KUMAR",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": Royal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": 20 lit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": 10 Cans",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": ₹ 400",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": 5 km",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": 11/2,Y street,T nagar,",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    Text(
                                      "   Chennai-600001.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      ": +91 73********",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          ": ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                              wordSpacing: 4),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
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
          Positioned(
            right: 27,bottom: 203,
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green
              ),
              child: ExpansionTile(
                trailing: Icon(
                   isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                    ),
                 title: Text('On its way',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                 children: [
                  Container(
                    child: ListTile(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>on_going_page_1()));
                      },
                      title: Text('Out for delivery',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'On-going Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 19,
          right: 15,
        ),
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/kumar3.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the customer",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product brand",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": RAM KUMAR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": Royal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 20 lit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 10 Cans",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": ₹ 400",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 5 km",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            Text(
                              "   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": +91 73********",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Reject'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'On-going Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 19,
          right: 15,
        ),
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/download.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the customer",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product brand",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": RAJA RAVI",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": Royal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 20 lit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 10 Cans",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": ₹ 400",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 5 km",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            Text(
                              "   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": +91 73********",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Reject'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'On-going Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 19,
          right: 15,
        ),
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/raja1.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the customer",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product brand",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": KUMAR RAJA",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": Royal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 20 lit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 10 Cans",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": ₹ 400",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 5 km",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            Text(
                              "   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": +91 73********",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Reject'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'On-going Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 19,
          right: 15,
        ),
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/raja2.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the customer",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product brand",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": DILEEP DL",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": Royal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 20 lit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 10 Cans",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": ₹ 400",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 5 km",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            Text(
                              "   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": +91 73********",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Reject'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class page6 extends StatelessWidget {
  const page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'On-going Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 19,
          right: 15,
        ),
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/raja3.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the customer",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product brand",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Product Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 16,
                                wordSpacing: 4),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": SARAVANAN",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": Royal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 20 lit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 10 Cans",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": ₹ 400",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 5 km",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            Text(
                              "   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              ": +91 73********",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Reject'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
