import 'package:dio/dio.dart';
import 'package:template/authentication/auth.dart';
import 'package:template/constants.dart';

Future<dynamic> getProfile() async {
  Response res = await dio.request(baseUrl + "/auth");
  return res.data;
}
