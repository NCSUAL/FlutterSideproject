import 'package:rxdart/rxdart.dart';
import 'package:side_project/model/Message_Models.dart';
import 'package:side_project/repository/Message_Received_Repository.dart';
class Message_Received_Bloc_API{
  final Message_Received_Repository _message_received_bloc_api = new Message_Received_Repository();
  final PublishSubject<Message_Models> _publishSubject = new PublishSubject<Message_Models>();

  //Message_Models 감지
  Stream<Message_Models> get stream => _publishSubject.stream;

  Future<void> get_Data() async{
    Message_Models message_models = await _message_received_bloc_api.get_Datas();
    _publishSubject.sink.add(message_models);
  }

  dispose() {
    _publishSubject.close();
  }
}