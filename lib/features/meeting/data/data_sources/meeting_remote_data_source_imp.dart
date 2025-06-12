import 'package:meeting_app/features/app/const/app_link_const.dart';
import 'package:meeting_app/features/app/services/network_services.dart';
import 'package:meeting_app/features/meeting/data/data_sources/meeting_remote_data_source.dart';
import 'package:meeting_app/features/meeting/data/models/meeting_model.dart';
import 'package:meeting_app/features/meeting/domain/entities/meeting_entity.dart';
// import 'package:uuid/uuid.dart';

class MeetingRemoteDataSourceImp extends MeetingRemoteDataSource {
  final NetworkServices networkServices;
  final String uid;

  MeetingRemoteDataSourceImp(
      {required this.networkServices, required this.uid});
  @override
  Future<RequestResult> createMeeting(MeetingEntity meeting) async {
    // String meetingId = Uuid().v1();

    Map data = {
      "meetingId": meeting.meetingId,
      "adminId": uid,
      "adminName": meeting.adminName,
      "adminProfileUrl": meeting.adminProfileUrl
    };

    try {
      return await networkServices.postCheckSuccess(
          link: AppLinkConst.createMeeting, body: data);
    } catch (e) {
      return RequestResult.failure;
    }
  }

  @override
  Future<RequestResult> startMeeting(MeetingEntity meeting) async {
    final adminData = MeetingModel(
      meetingId: meeting.meetingId,
    ).toJson();

    try {
      return await networkServices.postCheckSuccess(
          link: AppLinkConst.startMeeting, body: adminData);
    } catch (e) {
      return RequestResult.failure;
    }
  }

  @override
  Future<RequestResult> endMeeting(MeetingEntity meeting) async {
    final adminData = {
      "meetingAdminId": meeting.adminId,
      "meetingMemberId": meeting.memberId,
      "meetingMemberName": meeting.memberName,
      "meetingMemberProfileUrl": meeting.memberProfileUrl,
      "historyMeetingId": meeting.meetingId,
      "historyUserId": uid,
      "historyMeetingCreatedAt": meeting.createdAt,
      "historyMeetingEndedAt": DateTime.now().toString(),
      "historyOtherUserId":
          uid == meeting.adminId ? meeting.memberId : meeting.adminId,
      "historyMeetingDisc": "",
    };

    try {
      return await networkServices.postCheckSuccess(
          link: AppLinkConst.endMeeting, body: adminData);
    } catch (e) {
      return RequestResult.failure;
    }
  }

  @override
  Future<void> getMeetingChannelId(String id) {
    // TODO: implement getMeetingChannelId
    throw UnimplementedError();
  }

  @override
  Future<RequestResult> joinMeeting(MeetingEntity meeting) async {
    Map adminData = {
      "meetingId": meeting.meetingId,
      "memberId": uid,
      "memberName": meeting.memberName,
      "memberProfileUrl": meeting.memberProfileUrl
    };

    try {
      return await networkServices.postCheckSuccess(
          link: AppLinkConst.joinMeeting, body: adminData);
    } catch (e) {
      return RequestResult.failure;
    }
  }
}
