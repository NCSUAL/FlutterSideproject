import 'dart:convert';
import 'package:dio/dio.dart';

class Request_Api {
  late Dio dio = new Dio(BaseOptions(
      followRedirects: true,
      validateStatus: (status) {
        return status! < 500; // 500보다 작은 상태 코드만 유효하다고 간주
      },
      baseUrl: "http://52.231.111.238:8000/api/v1/"));
  final _auth = 'Basic ' + base64Encode(utf8.encode('test1:testpass'));

  Future<Response> get_Request(String address) async {
    final _response = await dio.get(address,
        options: Options(headers: <String, String>{'authorization': _auth}));
    if (_response.statusCode == 200) {
      return _response;
    } else {
      throw Exception("Api 요청 오류");
    }
  }

  Future<Response> get_Request_Include_param(String address, int id) async {
    final _response = await dio.get(address + '${id}/',
        options: Options(headers: <String, String>{'authorization': _auth}));
    if (_response.statusCode == 200) {
      return _response;
    } else {
      throw Exception("Api 요청 오류");
    }
  }

  Future<Response> patch_Request(
      String address, Map<String, dynamic> data, int id) async {
    final _response = await dio.patch(
        data: jsonEncode(data),
        address + "${id}/",
        options: Options(headers: <String, String>{'authorization': _auth}));

    if (_response.statusCode == 200) {
      return _response;
    } else {
      throw Exception("Api 요청 오류");
    }
  }
}
