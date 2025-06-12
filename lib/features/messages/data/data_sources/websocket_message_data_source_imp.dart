import 'dart:async';
import 'dart:convert';
import 'package:meeting_app/features/messages/data/data_sources/websocket_message_data_source.dart';
import 'package:meeting_app/features/messages/data/models/message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/entities/message_entity.dart';

class WebSocketMessageDataSourceImp extends WebSocketMessageDataSource {
  final WebSocketChannel _channel;
  final StreamController<MessageEntity> _incomingMessagesController =
      StreamController<MessageEntity>.broadcast();

  WebSocketMessageDataSourceImp(Uri uri)
      : _channel = WebSocketChannel.connect(uri) {
    _channel.stream.listen((data) {
      try {
        final jsonData = jsonDecode(data);
        if (jsonData['messages_status'] == 'new_message' ||
            jsonData['messages_status'] == 'edit_message') {
          _incomingMessagesController.add(MessageModel.fromJson(jsonData));
        } else if (jsonData['messages_status'] == 'message_deleted') {
          final deletedMessage = MessageEntity(
              id: jsonData['messages_id'] as int?,
              senderId: -1,
              content: '',
              type: 'deleted');
          _incomingMessagesController.add(deletedMessage);
        }
      } catch (e) {
        print('Error decoding WebSocket data: $e');
        _incomingMessagesController
            .addError(e); // Propagate the error to the stream
      }
    }, onError: (error) {
      print('WebSocket Stream Error: $error');
      _incomingMessagesController.addError(error); // Propagate stream errors
    }, onDone: () {
      print('WebSocket connection closed');
      _incomingMessagesController.close();
    });
  }
  @override
  // Future<void> sendMessage(MessageEntity message) async {
  //   try {
  //     MessageModel messageModel = MessageModel(
  //       id: message.id,
  //       content: message.content,
  //       senderId: message.senderId,
  //       type: message.type,
  //       meetingId: message.meetingId,
  //       profileUrl: message.profileUrl,
  //       receiverId: message.receiverId,
  //       senderName: message.senderName,
  //     );
  //     _channel.sink.add(jsonEncode(messageModel.toJsonForSend()));
  //   } catch (e) {
  //     print('Error sending message: $e');
  //     throw e; // Re-throw the error to be handled in the repository/use case
  //   }
  // }
  Future<void> sendMessage(MessageEntity message) async {
    MessageModel messageModel = MessageModel(
      id: message.id,
      content: message.content,
      senderId: message.senderId,
      type: message.type,
      meetingId: message.meetingId,
      profileUrl: message.profileUrl,
      receiverId: message.receiverId,
      senderName: message.senderName,
    );
    _channel.sink.add(jsonEncode(messageModel.toJsonForSend()));
  }

  @override
  Future<void> editMessage(MessageEntity message) async {
    try {
      MessageModel messageModel = MessageModel(
        id: message.id,
        content: message.content,
        senderId: message.senderId,
        type: message.type,
        meetingId: message.meetingId,
        profileUrl: message.profileUrl,
        receiverId: message.receiverId,
        senderName: message.senderName,
      );
      _channel.sink.add(jsonEncode(messageModel.toJsonForEdit()));
    } catch (e) {
      print('Error editing message: $e');
      throw e;
    }
  }

  @override
  Future<void> deleteMessage(int id, int senderId) async {
    try {
      _channel.sink.add(jsonEncode({
        'action': 'delete',
        'messages_id': id,
        'messages_sender_id': senderId
      }));
    } catch (e) {
      print('Error closing WebSocket: $e');
    }
  }

  @override
  Stream<MessageEntity> getIncomingMessages() =>
      _incomingMessagesController.stream;
  @override
  void close() {
    _channel.sink.close();
    _incomingMessagesController.close();
  }
}
