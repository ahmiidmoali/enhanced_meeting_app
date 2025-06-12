import 'package:meeting_app/features/messages/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  final int? id;
  final int senderId;
  final int? receiverId;
  final String content;
  final String type;
  final String? profileUrl;
  final String? senderName;
  final int? meetingId;

  MessageModel({
    this.id,
    required this.senderId,
    this.receiverId,
    required this.content,
    required this.type,
    this.profileUrl,
    this.senderName,
    this.meetingId,
  }) : super(
          id: id,
          senderId: senderId,
          receiverId: receiverId,
          content: content,
          type: type,
          profileUrl: type,
          senderName: senderName,
          meetingId: meetingId,
        );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['messages_id'],
      senderId: json['messages_sender_id'],
      receiverId: json['messages_reciever_id'],
      content: json['message_content'],
      type: json['messages_type'],
      profileUrl: json['messages_profile_url'],
      senderName: json['messages_sender_name'],
      meetingId: json['messages_meeting_id'],
    );
  }

  Map<String, dynamic> toJsonForSend() {
    return {
      'messages_sender_id': senderId,
      'messages_reciever_id': receiverId,
      'message_content': content,
      'messages_type': type,
      'messages_profile_url': profileUrl,
      'messages_sender_name': senderName,
      'messages_meeting_id': meetingId,
    };
  }

  Map<String, dynamic> toJsonForEdit() {
    return {
      'action': 'edit',
      'messages_id': id,
      'messages_sender_id': senderId,
      'message_content': content,
      'messages_type': type,
      'messages_profile_url': profileUrl,
      'messages_sender_name': senderName,
      'messages_meeting_id': meetingId,
    };
  }

  Map<String, dynamic> toJsonForDelete() {
    return {
      'action': 'delete',
      'messages_id': id,
      'messages_sender_id': senderId,
    };
  }
}
