import 'dart:convert';

import 'package:diox/diox.dart';

class GetNGOList {
  Dio _dio = Dio();

  Future<List> getHomeNGOList() async {
    var res = null;

    try {
      res =
          await _dio.get('https://betterhero.onrender.com/api/ngoPage/ngoList');
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
      res = await _dio
          .get('https://betterhero.onrender.com/api/search/?text=$text');
      final data = await json.decode(res.toString());
      return data['ngoSearchList'];
    } catch (e) {
      print(e);
    }

    return [];
  }
}
