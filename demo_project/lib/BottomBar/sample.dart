// import 'dart:async';
// import 'dart:convert';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// class InternetConnectivity {
//   static StreamController<bool> _controller =
//   StreamController<bool>.broadcast();
//
//   static Stream<bool> get isOnline => _controller.stream;
//
//   static void initialize() {
//     Connectivity().onConnectivityChanged.listen((result) {
//       _controller.add(result != ConnectivityResult.none);
//     });
//   }
//
//   static void dispose() {
//     _controller.close();
//   }
// }
//
// class ApiService {
//   DataModels? openseaModel;
//
//   Future<void> fetchData() async {
//     try {
//       http.Response response = await http.get(Uri.parse(
//           'https://api.opensea.io/api/v1/assets?collection=cryptopunks'));
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         openseaModel = DataModels.fromJson(result);
//       } else {
//         print('Error fetching data');
//       }
//     } catch (e) {
//       print('Error while getting data: $e');
//     }
//   }
// }
//
// class MyController extends GetxController {
//   final ApiService _apiService = ApiService();
//   var isLoading = false.obs;
//
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     InternetConnectivity.isOnline.listen((connected) {
//       if (connected) {
//         _apiService.fetchData().then((_) => isLoading(true));
//       } else {
//         print('No internet connection');
//       }
//     });
//   }
// }
//
// class DataModels {
//   String? status;
//   List<Categories>? categories;
//
//   DataModels({this.status, this.categories});
//
//   DataModels.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['assets'] != null) {
//       categories = <Categories>[];
//       json['assets'].forEach((v) {
//         categories!.add(Categories.fromJson(v));
//       });
//     }
//   }
// }
//
// class Categories {
//   String? id;
//   String? name;
//   String? thumbnail;
//   String? mediaCount;
//
//   Categories({this.id, this.name, this.thumbnail, this.mediaCount});
//
//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     thumbnail = json['thumbnail'];
//     mediaCount = json['num_sales'].toString();
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: MyAppication(),
//     );
//   }
// }
//
// class MyAppication extends StatelessWidget {
//   final MyController openseaController = Get.put(MyController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('OpenSea API')),
//       body: Obx(
//             () => openseaController.isLoading.value
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//           itemCount: openseaController._apiService.openseaModel?.categories?.length ?? 0,
//           itemBuilder: (context, index) {
//             final category = openseaController._apiService.openseaModel?.categories?[index];
//             return ListTile(
//               title: Text(category?.name ?? 'No Name'),
//               subtitle: Text('Media Count: ${category?.mediaCount ?? 'Unknown'}'),
//               leading: category?.thumbnail != null ? Image.network(category!.thumbnail!) : null,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
