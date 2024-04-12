
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Datamodel.dart';

class YourDataProvider with ChangeNotifier {
  List<AppSlider> _appSliderImages = [];
  List<ListofKitchens> _listofKitchens = [];
  List<AppSlider> get appSliderImages => _appSliderImages;
  List<ListofKitchens> get listofKitchens => _listofKitchens;

  final Dio _dio = Dio();

  YourDataProvider() {
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: 'https://eat.ind.in')).interceptor);
  }

  Future<void> fetchData() async {
    try {
      final apiUrl = 'https://eat.ind.in/api/user/appslider.php';
      final response = await _dio.post(
        apiUrl,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final data = Data.fromJson(jsonData['data']);
        _appSliderImages = data.appSlider!;
        _listofKitchens = data.listofKitchens!;
        notifyListeners();
        print(response);
      }
    } catch (e) {
      print('Error during data fetching: $e');
      // Handle error appropriately
    }
  }

  Future<void> saveDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('data', json.encode(_appSliderImages)); // Assuming _appSliderImages is the data you want to save
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString('data');
    print('Saved Data: $savedData');

    if (savedData != null) {
      print(_appSliderImages);
      _appSliderImages = (json.decode(savedData) as List<dynamic>)
          .map((item) => AppSlider.fromJson(item))
          .toList();
      notifyListeners();
    } else {
      // Data doesn't exist, fetch it
      await fetchData();
    }
  }
}
