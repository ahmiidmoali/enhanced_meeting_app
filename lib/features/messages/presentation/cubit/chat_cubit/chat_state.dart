import 'package:equatable/equatable.dart';
import 'package:meeting_app/features/messages/domain/entities/message_entity.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageEntity> messages;

  ChatLoaded(this.messages);
  @override
  List<Object?> get props => [messages];
}

class ChatError extends ChatState {
  final String errorMessages;

  ChatError(this.errorMessages);
  @override
  List<Object?> get props => [errorMessages];
}
