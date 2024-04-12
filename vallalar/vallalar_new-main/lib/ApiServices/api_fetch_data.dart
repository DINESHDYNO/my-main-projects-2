import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data_model.dart';

class DataClass extends ChangeNotifier {

  Future<DataModels?> getSinglePostData() async {
    DataModels? result;
    try {
      final response = await http.get(
        Uri.parse("https://vallalar.vrikshatech.in/api/categories"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = DataModels.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }


  DataModels? post;
  bool loading = false;
  bool _isDataFetched = false;

  getPostData() async {
    if (!_isDataFetched) {
      loading = true;
      post = await getSinglePostData();
      loading = false;
      _isDataFetched = true;
      notifyListeners();
    }
  }
}




