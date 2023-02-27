import 'dart:convert';

import 'package:diox/diox.dart';

class GetNGOData {
  Dio _dio = Dio();

  Future<Map<String, dynamic>> getNGOData(String uid) async {
    var res = null;

    try {
      res = await _dio
          .get('https://betterhero.onrender.com/api/ngoPage/getNGO?uid=$uid');
      final data = await json.decode(res.toString());
      return data['ngoData'];
    } catch (e) {
      print(e);
    }
    return {};
  }
}
