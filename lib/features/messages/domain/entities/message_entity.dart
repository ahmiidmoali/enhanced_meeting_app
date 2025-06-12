import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final int? id;
  final int senderId;
  final int? receiverId;
  final String content;
  final String type;
  final String? profileUrl;
  final String? senderName;
  final int? meetingId;

  MessageEntity({
    this.id,
    required this.senderId,
    this.receiverId,
    required this.content,
    required this.type,
    this.profileUrl,
    this.senderName,
    this.meetingId,
  });
// MessageModel messageModel = MessageModel(id: message.id,content: message.content,senderId: message.senderId,type: message.type,meetingId: message.meetingId,profileUrl: message.profileUrl,receiverId: message.receiverId,senderName: message.senderName,);
  @override
  List<Object?> get props => [
        id,
        senderId,
        receiverId,
        content,
        type,
        profileUrl,
        senderName,
        meetingId,
      ];
}
