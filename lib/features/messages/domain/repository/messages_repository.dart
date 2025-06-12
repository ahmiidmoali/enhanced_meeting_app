import '../entities/message_entity.dart';

abstract class MessageRepository {
  Future<void> sendMessage(MessageEntity message);
  Future<void> editMessage(MessageEntity message);
  Future<void> deleteMessage(int id);
  Stream<MessageEntity> getNewMessages();
}
// send_message_usecase   edit_message_usecase   delete_message_usecase   get_new_messages_usecase