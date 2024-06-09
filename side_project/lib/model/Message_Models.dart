import 'package:side_project/model/Message_Model.dart';

class Message_Models{
  late List<Message_Model> datas;

  Message_Models({required this.datas});

  Message_Models.fromJson(List<dynamic> Json){
    datas = List<Message_Model>.empty(growable: true);

    for(dynamic a in Json){
      datas.add(Message_Model.fromJson(a));
    }
  }
}