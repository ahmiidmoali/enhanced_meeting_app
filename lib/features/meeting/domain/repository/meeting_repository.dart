import 'package:meeting_app/features/app/services/network_services.dart';
import 'package:meeting_app/features/meeting/domain/entities/meeting_entity.dart';

abstract class MeetingRepository {
  Future<RequestResult> startMeeting(MeetingEntity meeting);
  Future<RequestResult> createMeeting(MeetingEntity meeting);
  Future<RequestResult> endMeeting(MeetingEntity meeting);
  Future<RequestResult> joinMeeting(MeetingEntity meeting);
  Future<void> getMeetingChannelId(String id);
}
//start_meeting_usecase create_meeting_usecase end_meeting_usecase save_meeting_history_usecase.dart get_meeting_channel_id_usecase.dart