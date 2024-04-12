import 'package:flutter/material.dart';
import 'package:shopping_order/Tabbar/Completed_order.dart';
import 'package:shopping_order/Tabbar/Current_order.dart';
import 'package:shopping_order/Tabbar/On-going_order.dart';
class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.green,
          actions: [
            Icon(Icons.notifications_active_outlined),
            SizedBox(width: 13,),
          ],
          title: const Padding(
            padding: const EdgeInsets.all(1.0),
            child: const Row(
              children: [
                Icon(Icons.shopping_cart_outlined),
                SizedBox(width: 20,),
                Text('Orders',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            physics: BouncingScrollPhysics(),
            indicatorWeight: 3,
            tabs: [
               Tab(
                text: 'Current orders',
              ),
              Tab(
                text: 'On-going orders',
              ),
              Tab(
                text: 'Completed orders',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CurrentOrder(),
            ongoingorder(),
            complete_order(),
          ],
        ),
      ),
    );
  }
}
