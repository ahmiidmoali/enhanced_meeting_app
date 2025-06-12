import 'package:meeting_app/features/messages/domain/repository/messages_repository.dart';

import '../entities/message_entity.dart';

class GetNewMessagesUsecase {
  final MessageRepository repository;

  GetNewMessagesUsecase({required this.repository});
  Stream<MessageEntity> call() {
    return repository.getNewMessages();
  }
}
