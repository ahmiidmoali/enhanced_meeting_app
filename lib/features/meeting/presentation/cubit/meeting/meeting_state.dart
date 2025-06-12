import 'package:equatable/equatable.dart';

sealed class MeetingState extends Equatable {
  const MeetingState();

  @override
  List<Object?> get props => [];
}

class MeetingInitial extends MeetingState {}

class MeetingLoadingScreen extends MeetingState {}

class MeetingStartingSuccess extends MeetingState {}

class MeetingStartingFailed extends MeetingState {}

class MeetingEndingSuccess extends MeetingState {}

class MeetingEndingFailed extends MeetingState {}

class MeetingJoiningSuccess extends MeetingState {}

class MeetingJoiningFailed extends MeetingState {}

class MeetingCreatingSuccess extends MeetingState {}

class MeetingCreatingFailed extends MeetingState {}
