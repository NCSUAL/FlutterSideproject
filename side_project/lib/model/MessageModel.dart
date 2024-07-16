import 'dart:convert';

import 'package:equatable/equatable.dart';

class Snsinfos extends Equatable {
  final int id;
  final String service;
  final String username;

  const Snsinfos(
      {required this.id, required this.username, required this.service});

  factory Snsinfos.fromJson(Map<String, dynamic> Json) => Snsinfos(
      id: Json['id'], service: Json['service'], username: Json['username']);
  @override
  // TODO: implement props
  List<Object?> get props => [id, service, username];
}

class Contacts extends Equatable {
  final int id;
  final String phone_number;
  final List<dynamic> snsinfos;

  const Contacts(
      {required this.id, required this.phone_number, required this.snsinfos});

  factory Contacts.fromJson(Map<String, dynamic> Json) => Contacts(
      id: Json['id'],
      phone_number: Json['phone_number'],
      snsinfos: Json['snsinfos'].map((e) => Snsinfos.fromJson(e)).toList());
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MessageModel extends Equatable {
  final int? id;
  final String? sender_name;
  final String? receiver_name;
  final List<dynamic>? contacts;
  final String? content;
  final String? status;
  final Map<String, dynamic>? message_type;

  const MessageModel(
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
      contacts: Json["contacts"].map((e) => Contacts.fromJson(e)).toList(),
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
