import 'package:meeting_app/features/messages/domain/entities/message_entity.dart';

abstract class WebSocketMessageDataSource {
  Future<void> sendMessage(MessageEntity message);
  Future<void> editMessage(MessageEntity message);
  Future<void> deleteMessage(int id, int senderId);
  Stream<MessageEntity> getIncomingMessages();
  void close();
}
