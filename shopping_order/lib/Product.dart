class OrderData {
  final String name;
  final String product;
  final String description;
  final String image;

  OrderData(this.name,this.product,this.description,this.image);
}
 List<OrderData>getOrderData(){
  List<OrderData> items=<OrderData>[];
  items.add(
    OrderData(
      'DINESH DINO',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/raja.jpg',
    ),

);
  items.add(
    OrderData(
      'RAM KUMAR',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/kumar3.png',
    ),

  );
  items.add(
    OrderData(
      'RAJA RAVI',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/download.jpg',
    ),

  );
  items.add(
    OrderData(
      'KUMAR RAJ',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/raja1.jpg',
    ),

  );
  items.add(
    OrderData(
      'DILEEP DL',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/raja2.jpg',
    ),
  );
  items.add(
    OrderData(
      'SARAVANAN',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/raja3.jpg',
    ),

  );
  items.add(
    OrderData(
      'DINESH DINO',
      'Royal - 20 lit',
      '10 Cans | ₹ 400',
      'assets/images/raja.jpg',
    ),

  );
  return items;

}