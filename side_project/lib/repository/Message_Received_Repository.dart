import 'package:side_project/api/Api_Message_Received.dart';
import 'package:side_project/model/Message_Model.dart';
import 'package:side_project/model/Message_Models.dart';

class Message_Received_Repository{
  final Api_Message_Received _api_message_received_provider = new Api_Message_Received();

  Future<Message_Models> get_Datas() async => await _api_message_received_provider.message_received_Get();
}