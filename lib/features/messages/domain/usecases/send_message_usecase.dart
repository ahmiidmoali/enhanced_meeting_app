import 'package:meeting_app/features/messages/domain/repository/messages_repository.dart';

import '../entities/message_entity.dart';

class SendMessageUsecase {
  final MessageRepository repository;

  SendMessageUsecase({required this.repository});
  Future<void> call(MessageEntity message) async {
    return await repository.sendMessage(message);
  }
}
