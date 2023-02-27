import 'dart:convert';

import 'package:diox/diox.dart';

class GetNGOList {
  Dio _dio = Dio();

  Future<List> getHomeNGOList(String location) async {
    var res = null;

    try {
      res = await _dio.get(
          'http://192.168.1.3:3000/api/ngoPage/ngoList?location=$location');
      final data = await json.decode(res.toString());
      return data['ngoData'];
    } catch (e) {
      print(e);
    }

    return [];
  }

  Future<List> getSearchNGOList(String text) async {
    var res = null;

    try {
      res = await _dio.get('http://192.168.1.3:3000/api/search/?text=$text');
      final data = await json.decode(res.toString());
      return data['ngoSearchList'];
    } catch (e) {
      print(e);
    }

    return [];
  }
}
