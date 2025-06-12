import 'package:meeting_app/features/messages/domain/repository/messages_repository.dart';

import '../entities/message_entity.dart';

class EditMessageUsecase {
  final MessageRepository repository;

  EditMessageUsecase({required this.repository});
  Future<void> call(MessageEntity message) async {
    return await repository.editMessage(message);
  }
}
