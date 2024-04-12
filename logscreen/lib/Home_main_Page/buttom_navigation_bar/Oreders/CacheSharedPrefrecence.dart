
import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String _allDataKey = 'allData';

  Future<void> storeAllData(dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_allDataKey, jsonEncode(data));
  }

  Future<dynamic?> fetchAllData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_allDataKey);
    return jsonData != null ? jsonDecode(jsonData) : null;
  }

  Future<void> clearCache() async {
    await DefaultCacheManager().emptyCache();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_allDataKey);
  }
}
