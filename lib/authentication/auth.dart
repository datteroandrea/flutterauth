import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/constants.dart';
import 'package:ninja/ninja.dart';

final aes = AESKey(Uint8List.fromList(List.generate(16, (i) => i)));

final Dio dio = new Dio();

Future<String?> signin(String email, String password) async {
  Response response = await dio.post(baseUrl + "/auth/login",
      data: {"email": email, "password": password});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (response.data is String) {
    String token = aes.encryptToBase64(response.data);
    prefs.setString("token", token);
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.headers["Authorization"] = "Bearer " + response.data;
      options.headers["Accept"] = "application/json";
      handler.next(options);
    }));
    print("Logged in!");
  } else {
    return "Wrong email or password!";
  }
}

void signup(String username, String email, String password) async {
  Response response = await dio.post(baseUrl + "/auth/register",
      data: {"username": username, "email": email, "password": password});
  print(response);
  // redirect to page based on response
}

Future<String?> isAuthenticated() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  if (token != null)
    return aes.decryptToUtf8(token);
  else
    return null;
}
