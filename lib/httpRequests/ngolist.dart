import 'dart:convert';
import 'package:diox/diox.dart';

class GetNGOList {
  Dio _dio = Dio();

  Future<List> getHomeNGOList() async {
    var res = null;

    try {
      res = await _dio.get('http://192.168.1.5:3000/api/ngoPage/getNGO');
    } catch (e) {
      print(e);
    }

    final data = await json.decode(res.toString());
    return data['ngoData'];
  }
}
