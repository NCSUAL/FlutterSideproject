class Message_Model{
  int? id;
  String? sender_name;
  String? receiver_name;
  List? contacts;
  String? content;
  String? status;
  Map<String,dynamic>? message_type;

  Message_Model({this.id,this.sender_name,this.receiver_name,this.contacts,this.message_type,this.content,this.status});

  factory Message_Model.fromJson(Map<String, dynamic> Json) =>
      Message_Model(
          id: Json["id"],
          sender_name: Json["sender_name"],
          receiver_name: Json["receiver_name"],
          contacts: Json["contacts"],
          message_type: Json["message_type"],
          status: Json["status"],
          content: Json["content"]
      );
}