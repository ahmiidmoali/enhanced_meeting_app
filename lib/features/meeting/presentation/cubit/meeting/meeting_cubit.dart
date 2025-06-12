import 'package:bloc/bloc.dart';
import 'package:meeting_app/features/app/services/network_services.dart';
import 'package:meeting_app/features/meeting/domain/usecases/create_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/domain/usecases/end_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/domain/usecases/join_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/domain/usecases/start_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/presentation/cubit/meeting/meeting_state.dart';

import '../../../domain/entities/meeting_entity.dart';

class MeetingCubit extends Cubit<MeetingState> {
  final CreateMeetingUsecase createMeetingUsecase;
  final EndMeetingUsecase endMeetingUsecase;
  final JoinMeetingUsercase joinMeetingUsercase;
  final StartMeetingUsecase startMeetingUsecase;
  MeetingCubit(
      {required this.createMeetingUsecase,
      required this.endMeetingUsecase,
      required this.joinMeetingUsercase,
      required this.startMeetingUsecase})
      : super(MeetingInitial());

  Future<void> joinMeeting(MeetingEntity meeting) async {
    emit(MeetingLoadingScreen());
    try {
      joinMeetingUsercase.call(meeting).then(
        (response) {
          if (response == RequestResult.success) {
            emit(MeetingJoiningSuccess());
          } else {
            emit(MeetingJoiningFailed());
          }
        },
      );
    } catch (e) {
      emit(MeetingJoiningFailed());
    }
  }

  Future<void> startMeeting(MeetingEntity meeting) async {
    emit(MeetingLoadingScreen());
    try {
      startMeetingUsecase.call(meeting).then(
        (response) {
          if (response == RequestResult.success) {
            emit(MeetingStartingSuccess());
          } else {
            emit(MeetingStartingFailed());
          }
        },
      );
    } catch (e) {
      emit(MeetingStartingFailed());
    }
  }

  Future<void> endMeeting(MeetingEntity meeting) async {
    emit(MeetingLoadingScreen());
    try {
      endMeetingUsecase.call(meeting).then(
        (response) {
          if (response == RequestResult.success) {
            emit(MeetingEndingSuccess());
          } else {
            emit(MeetingEndingFailed());
          }
        },
      );
    } catch (e) {
      emit(MeetingEndingFailed());
    }
  }

  Future<void> createMeeting(MeetingEntity meeting) async {
    try {
      emit(MeetingLoadingScreen());
      createMeetingUsecase.call(meeting).then(
        (response) {
          if (response == RequestResult.success) {
            emit(MeetingCreatingSuccess());
          } else {
            emit(MeetingCreatingFailed());
          }
        },
      );
    } catch (e) {
      emit(MeetingCreatingFailed());
    }
  }
}
