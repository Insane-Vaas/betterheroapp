import 'dart:convert';
import 'package:betterheroapp/model/usermodel/usermodel.dart';
import 'package:diox/diox.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnBoardingBackend {
  Dio _dio = Dio();

  Future<dynamic> getuid() async {
    var response = null;
    try {
      String? data = await FirebaseAuth.instance.currentUser?.uid;
      response = await _dio.get(
          'http://192.168.1.6:3000/api/userprofile/checkuser?userUID=' +
              data.toString());
    } catch (e) {
      print(e);
    }
    final data1 = await jsonDecode(response.toString());
    print(data1["useruid"]);
    if (data1["useruid"] == null) return null;
    return data1["useruid"];
  }

  Future<dynamic> postUserData(UserModel userData) async {
    var response = null;

    try {
      await _dio.post(
        "http://192.168.1.6:3000/api/userprofile/postuserdata?userFirstName=${userData.userFirstName}&userLastName=${userData.userLastName}&userPhoneNumber=${userData.userPhoneNumber}&userUID=${userData.userUID}&userEmailID=${userData.userEmailID}&userGender=${userData.userGender}",
      );
    } catch (e) {
      print(e);
    }

    return "Code running";
  }
}
