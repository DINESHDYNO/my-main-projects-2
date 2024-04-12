import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'apimodel.dart';

class YourDataProvider with ChangeNotifier {
  List<AppSlider> _appSliderImages = [];
  List<ListofKitchens> _listofKitchens = [];
  List<AppSlider> get appSliderImages => _appSliderImages;
  List<ListofKitchens> get listofKitchens => _listofKitchens;

  final Dio _dio = Dio();

  YourDataProvider() {
    _dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: 'https://eat.ind.in')).interceptor);
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
      }
    } catch (e) {
      print('Error during data fetching: $e');
      // Handle error appropriately
    } finally {
      notifyListeners();
    }
  }
}
