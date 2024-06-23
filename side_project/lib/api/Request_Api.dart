import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:side_project/model/Message_Model.dart';
import 'package:side_project/model/Message_Models.dart';

class Request_Api{
  final _auth = 'Basic '+ base64Encode(utf8.encode('test2:testpass'));
  static const _url = "http://52.231.111.238:8000/api/v1/";
  late http.Client client;


  Future<http.Response> get_Request(String address) async{
    client = new http.Client();
    final _response = await client.get(Uri.parse('$_url$address'),
        headers: <String, String>{'authorization': _auth});

    if(_response.statusCode==200){
      return _response;
    }
    else{
      throw Exception("Api 요청 오류");
    }
  }

}