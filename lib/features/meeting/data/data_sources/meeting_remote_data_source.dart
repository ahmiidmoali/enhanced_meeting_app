import 'package:meeting_app/features/app/services/network_services.dart';
import 'package:meeting_app/features/meeting/domain/entities/meeting_entity.dart';

abstract class MeetingRemoteDataSource {
  Future<RequestResult> startMeeting(MeetingEntity meeting);
  Future<RequestResult> createMeeting(MeetingEntity meeting);
  Future<RequestResult> endMeeting(MeetingEntity meeting);
  Future<RequestResult> joinMeeting(MeetingEntity meeting);
  Future<void> getMeetingChannelId(String id);
}
