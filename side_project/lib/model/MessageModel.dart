import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  int? id;
  String? sender_name;
  String? receiver_name;
  List? contacts;
  String? content;
  String? status;
  Map<String, dynamic>? message_type;

  MessageModel(
      {this.id,
      this.sender_name,
      this.receiver_name,
      this.contacts,
      this.message_type,
      this.content,
      this.status});

  factory MessageModel.fromJson(Map<String, dynamic> Json) => MessageModel(
      id: Json["id"],
      sender_name: Json["sender_name"],
      receiver_name: Json["receiver_name"],
      contacts: Json["contacts"],
      message_type: Json["message_type"],
      status: Json["status"],
      content: Json["content"]);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        sender_name,
        receiver_name,
        receiver_name,
        contacts,
        status,
        message_type
      ];
}

class MappingMessageModel extends Equatable {
  late List<MessageModel> alldatas;
  late List<MessageModel> ringdatas;
  late List<MessageModel> heartdatas;
  MappingMessageModel(
      {required this.alldatas,
      required this.heartdatas,
      required this.ringdatas});

  MappingMessageModel.fromJson(List<dynamic> Json) {
    alldatas = List<MessageModel>.empty(growable: true);
    ringdatas = List<MessageModel>.empty(growable: true);
    heartdatas = List<MessageModel>.empty(growable: true);

    for (Map<String, dynamic> a in Json) {
      //거부한 메세지는 처리 안함
      if (a['status'] != "refused") {
        final messageModel = MessageModel.fromJson(a);
        alldatas.add(messageModel);
        if (a["message_type"]['name'] == 'heart') {
          heartdatas.add(messageModel);
        }
        if (a["message_type"]['name'] == 'ring') {
          ringdatas.add(messageModel);
        }
      }
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [alldatas, heartdatas, ringdatas];
}
