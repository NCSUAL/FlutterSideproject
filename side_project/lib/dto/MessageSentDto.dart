import 'package:equatable/equatable.dart';

class MessageSentDto extends Equatable {
  final int sender_id;
  final int receiver_id;
  final int message_type_id;
  final String content;

  const MessageSentDto(
      {required this.sender_id,
      required this.content,
      required this.message_type_id,
      required this.receiver_id});

  Map<String, dynamic> toJson() {
    return {
      "sender_id": this.sender_id,
      "receiver_id": this.receiver_id,
      "message_type_id": this.message_type_id,
      "content": this.content
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
