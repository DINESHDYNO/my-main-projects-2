import 'package:flutter/material.dart';
import 'package:shopping_order/Product.dart';
import 'package:shopping_order/Tabbar/current_order_next_page.dart';

class CurrentOrder extends StatelessWidget {
  final items=getOrderData();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
            final order=items[index];
              return InkWell(
                onTap: (){
                  _onItemTap(context, index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5,bottom: 6),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(order.image, width: 70, height: 70, fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.name,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                order.product,
                                style: TextStyle(fontSize: 14, color: Colors.grey[500], fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                order.description,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                    ),
                                    onPressed: () {
                                    },
                                    child: const Text('Accept'),
                                  ),
                                  const SizedBox(width: 12,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Reject'),
                                  ),
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const currentnextpage()));
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
        MaterialPageRoute(builder: (context) => const page6()),
      );
      break;
    default:
      break;
  }
}

class currentnextpage extends StatelessWidget {
  const currentnextpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Current Orders',
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
                          SizedBox(height: 15,),
                          Text("Product brand",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Product Name",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Quantity",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Price",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Delivery",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Address",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 35,),
                          Text("Phone number",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),)
                        ],
                      ),
                    ),
                    SizedBox(width: 13,),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": DINESH DINO",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),
                            ),
                            SizedBox(height: 15,),
                            Text(": Royal",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 20 lit",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 10 Cans",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": ₹ 400",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 5 km",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            Text("   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": +91 73********",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
                    onPressed: () {
                    },
                    child: Text('Accept'),
                  ),
                  SizedBox(width: 40,),
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

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Current Orders',
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
              const SizedBox(
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
                      child: const Column(
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
                          SizedBox(height: 15,),
                          Text("Product brand",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Product Name",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Quantity",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Price",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Delivery",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Address",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 35,),
                          Text("Phone number",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 13,),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: const Column(
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
                            SizedBox(height: 15,),
                            Text(": Royal",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 20 lit",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 10 Cans",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": ₹ 400",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 5 km",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            Text("   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": +91 73********",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
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
                    onPressed: () {
                    },
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 40,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Reject'),
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
        title: const Text(
          'Current Orders',
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
              const SizedBox(
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
                      child: const Column(
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
                          SizedBox(height: 15,),
                          Text("Product brand",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Product Name",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Quantity",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Price",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Delivery",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Address",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 35,),
                          Text("Phone number",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 13,),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: const Column(
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
                            SizedBox(height: 15,),
                            Text(": Royal",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 20 lit",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 10 Cans",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": ₹ 400",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 5 km",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            Text("   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": +91 73********",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
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
                    onPressed: () {
                    },
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 40,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Reject'),
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
        title: const Text(
          'Current Orders',
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
              const SizedBox(
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
                      child: const Column(
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
                          SizedBox(height: 15,),
                          Text("Product brand",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Product Name",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Quantity",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Price",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Delivery",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Address",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 35,),
                          Text("Phone number",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 13,),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: const Column(
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
                            SizedBox(height: 15,),
                            Text(": Royal",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 20 lit",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 10 Cans",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": ₹ 400",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 5 km",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            Text("   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": +91 73********",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
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
                    onPressed: () {
                    },
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 40,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Reject'),
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
        title: const Text(
          'Current Orders',
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
              const SizedBox(
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
                      child: const Column(
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
                          SizedBox(height: 15,),
                          Text("Product brand",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Product Name",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Quantity",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Price",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Delivery",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Address",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 35,),
                          Text("Phone number",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 13,),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: const Column(
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
                            SizedBox(height: 15,),
                            Text(": Royal",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 20 lit",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 10 Cans",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": ₹ 400",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 5 km",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            Text("   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": +91 73********",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
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
                    onPressed: () {
                    },
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 40,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Reject'),
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
        title: const Text(
          'Current Orders',
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
              const SizedBox(
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
                      child: const Column(
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
                          SizedBox(height: 15,),
                          Text("Product brand",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Product Name",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Quantity",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Price",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Delivery",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 15,),
                          Text("Address",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),),
                          SizedBox(height: 35,),
                          Text("Phone number",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                              fontSize: 16,
                              wordSpacing: 4),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 13,),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: const Column(
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
                            SizedBox(height: 15,),
                            Text(": Royal",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 20 lit",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 10 Cans",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": ₹ 400",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 5 km",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": 11/2,Y street,T nagar,",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            Text("   Chennai-600001.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 4),),
                            SizedBox(height: 15,),
                            Text(": +91 73********",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                                wordSpacing: 4),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
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
                    onPressed: () {
                    },
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 40,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Reject'),
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



