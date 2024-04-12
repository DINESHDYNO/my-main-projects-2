import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const One());
}

class One extends StatelessWidget {
  const One({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Two(),
      color: Colors.green,
    );
  }
}

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  final FetchData data = FetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data'),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder<List<DataModel>>(
        future: data.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<DataModel>? kitchenList = snapshot.data;
            return ListView.builder(
              itemCount: kitchenList?.length ?? 0,
              itemBuilder: (context, index) {
                DataModel? item = kitchenList?[index];
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text("User ID : ${item?.id.toString()?? ''}"),
                      subtitle: Text(item?.body ?? ''),
                      // Design Your UI After This
                    ),
                  ),
                  onTap: (){
                    // Set your Function in This and Action
                  } ,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class FetchData {
  var data = [];
  String fetchUrl = 'https://jsonplaceholder.typicode.com/posts'; //Replace your api

  Future<List<DataModel>> getUserList() async {
    List<DataModel> result = [];
    var url = Uri.parse(fetchUrl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data.map((e) => DataModel.fromJson(e)).toList();
      } else {
        print('API error');
      }
    } on Exception catch (e) {
      print('Error: $e');
    }
    return result;
  }
}

class DataModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  DataModel({this.userId, this.id, this.title, this.body});

  DataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];// Replace Your Parameter What Ever You Want
    id = json['id'];// Replace Your Parameter What Ever You Want
    title = json['title'];// Replace Your Parameter What Ever You Want
    body = json['body'];// Replace Your Parameter What Ever You Want
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
