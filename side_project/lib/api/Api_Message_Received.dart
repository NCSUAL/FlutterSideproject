import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:side_project/model/Message_Model.dart';
import 'package:side_project/model/Message_Models.dart';

class Api_Message_Received{
  final _auth = 'Basic '+ base64Encode(utf8.encode('test1:testpass'));
  static const _url = "http://52.231.111.238:8000/api/v1/message/received/";
  late Client client;

  Future<Message_Models> message_received_Get() async{
    client = Client();
    final _response = await client.get(Uri.parse(_url),
        headers: <String, String>{'authorization': _auth});

    if(_response.statusCode==200){
      return Message_Models.fromJson(jsonDecode(_response.body));
    }
    else{
      throw Exception("Api 호출 실패");
    }


  }

}