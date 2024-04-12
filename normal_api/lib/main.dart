import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
      color: Colors.green,
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {


  List items=[];

  listProducts()async{
    String url11='https://eat.ind.in/api/user/appslider.php';
    var response= await http.get(Uri.parse(url11));
    if(response.statusCode==200){
      setState(() {
        items=jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Normal Api Calling'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){
            listProducts();
          }, icon: Icon(Icons.search))
        ],
      ),
      body: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ram(item: items[0]),
            ),
          );
        },
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context,index){
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Image.network(items[index]["status"])),
                        ),
                       /* title: Text(items[index]["title"]),
                        subtitle: Text(items[index]["price"].toString()),
                      ),
                      Text("\$"+items[index]["price"].toString(),style: TextStyle(
                        fontSize:15,fontWeight: FontWeight.bold
                      ),),
                SizedBox(height: 5,),
                Text("Category : "+items[index]["category"]*/)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}


class ram extends StatelessWidget {
  final  item;

  ram({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Image.network(item["image"])),
          ),
          Text(item["title"]),
          Text("\$" + item["price"].toString()),
          Text("Category: " + item["category"]),
        ],
      ),
    );
  }
}
