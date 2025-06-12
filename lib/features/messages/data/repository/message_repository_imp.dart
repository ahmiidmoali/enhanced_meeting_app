import 'package:meeting_app/features/messages/data/data_sources/websocket_message_data_source.dart';
import 'package:meeting_app/features/messages/domain/entities/message_entity.dart';

import '../../domain/repository/messages_repository.dart';

class MessageRepositoryImp implements MessageRepository {
  final WebSocketMessageDataSource _dataSource;

  MessageRepositoryImp(this._dataSource);

  @override
  Future<void> sendMessage(MessageEntity message) async {
    await _dataSource.sendMessage(message);
  }

  @override
  Future<void> editMessage(MessageEntity message) async {
    await _dataSource.editMessage(message);
  }

  @override
  Future<void> deleteMessage(int messageId) async {
    // You might need to get the sender ID from your app's state
    // For now, assuming it's available.
    // Consider how to securely handle this.
    const int currentUserId = 123; // Replace with actual user ID
    await _dataSource.deleteMessage(messageId, currentUserId);
  }

  @override
  Stream<MessageEntity> getNewMessages() {
    return _dataSource.getIncomingMessages();
  }
}
