import 'package:meeting_app/features/meeting/domain/entities/meeting_entity.dart';

class MeetingModel extends MeetingEntity {
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

  MeetingModel({
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
  }) : super(
          meetingId: meetingId,
          adminId: adminId,
          adminName: adminName,
          adminProfileUrl: adminProfileUrl,
          memberId: memberId,
          memberName: memberName,
          memberProfileUrl: memberProfileUrl,
          isMeetingStarted: isMeetingStarted,
          isMeetingEnded: isMeetingEnded,
          createdAt: createdAt,
          endedAt: createdAt,
        );
  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
        meetingId: json["meetingId"],
        adminId: json["adminId"],
        adminName: json["adminName"],
        adminProfileUrl: json["adminProfileUrl"],
        memberId: json["memberId"],
        memberName: json["memberName"],
        memberProfileUrl: json["memberProfileUrl"],
        isMeetingStarted: json["isMeetingStarted"],
        isMeetingEnded: json["isMeetingEnded"],
        createdAt: json["createdAt"],
        endedAt: json["endedAt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["meetingId"] = meetingId;
    data["adminId"] = adminId;
    data["adminName"] = adminName;
    data["adminProfileUrl"] = adminProfileUrl;
    data["memberId"] = memberId;
    data["memberName"] = memberName;
    data["memberProfileUrl"] = memberProfileUrl;
    data["isMeetingStarted"] = isMeetingStarted;
    data["isMeetingEnded"] = isMeetingEnded;
    data["createdAt"] = createdAt;
    data["endedAt"] = endedAt;
    return data;
  }
}
