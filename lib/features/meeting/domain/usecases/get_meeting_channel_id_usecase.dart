import 'package:meeting_app/features/meeting/domain/repository/meeting_repository.dart';

class GetMeetingChannelIdUsecase {
  final MeetingRepository repository;

  const GetMeetingChannelIdUsecase({required this.repository});
  Future<void> call(String id) async {
    return await repository.getMeetingChannelId(id);
  }
}
