import 'package:equatable/equatable.dart';

class MeetingEntity extends Equatable {
  final String? meetingId;
  final String? adminId;
  final String? adminName;
  final String? adminProfileUrl;

  final String? memberId;
  final String? memberName;
  final String? memberProfileUrl;
  final String? isMeetingStarted;
  final String? isMeetingEnded;
  final String? createdAt;
  final String? endedAt;

  const MeetingEntity({
    this.meetingId,
    this.adminId,
    this.adminName,
    this.adminProfileUrl,
    this.memberId,
    this.memberName,
    this.memberProfileUrl,
    this.isMeetingStarted,
    this.isMeetingEnded,
    this.createdAt,
    this.endedAt,
  });

  @override
  List<Object?> get props => [
        meetingId,
        adminId,
        adminName,
        adminProfileUrl,
        memberId,
        memberName,
        memberProfileUrl,
        isMeetingStarted,
        isMeetingStarted,
        createdAt,
        endedAt
      ];
}
