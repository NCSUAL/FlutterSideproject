import 'dart:convert';

import 'package:side_project/api/Request_Api.dart';
import 'package:side_project/model/Message_Models.dart';
import 'package:side_project/repository/Repository.dart';

import '../model/Message_Model.dart';
class ApiController<T> extends Request_Api{
  late final _response;
  static const String _messageRecived = 'message/received/';

  Future<T> data_provider(T category) async{
    switch(category){

      case Message_Models:
        //받은 메세지
        _response = await get_Request(_messageRecived);
        return Message_Models.fromJson(jsonDecode(_response.body)) as T;


      default:
        throw Exception("예기치 못한 오류");
    }

  }
}