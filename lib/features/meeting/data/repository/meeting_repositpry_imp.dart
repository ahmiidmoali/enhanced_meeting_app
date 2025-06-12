import 'package:meeting_app/features/app/services/network_services.dart';
import 'package:meeting_app/features/meeting/data/data_sources/meeting_remote_data_source.dart';
import 'package:meeting_app/features/meeting/domain/entities/meeting_entity.dart';
import 'package:meeting_app/features/meeting/domain/repository/meeting_repository.dart';

class MeetingRepositpryImp extends MeetingRepository {
  final MeetingRemoteDataSource remoteDataSource;

  MeetingRepositpryImp({required this.remoteDataSource});
  @override
  Future<RequestResult> endMeeting(MeetingEntity meeting) =>
      remoteDataSource.endMeeting(meeting);

  @override
  Future<void> getMeetingChannelId(String id) =>
      remoteDataSource.getMeetingChannelId(id);

  @override
  Future<RequestResult> joinMeeting(MeetingEntity meeting) =>
      remoteDataSource.joinMeeting(meeting);

  @override
  Future<RequestResult> startMeeting(MeetingEntity meeting) =>
      remoteDataSource.startMeeting(meeting);

  @override
  Future<RequestResult> createMeeting(MeetingEntity meeting) =>
      remoteDataSource.createMeeting(meeting);
}
