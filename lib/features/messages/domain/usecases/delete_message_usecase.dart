import 'package:meeting_app/features/messages/domain/repository/messages_repository.dart';

class DeleteMessageUsecase {
  final MessageRepository repository;

  DeleteMessageUsecase({required this.repository});
  Future<void> call(int id) async {
    return await repository.deleteMessage(id);
  }
}
