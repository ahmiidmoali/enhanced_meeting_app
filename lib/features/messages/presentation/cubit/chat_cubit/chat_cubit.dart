import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meeting_app/features/messages/domain/entities/message_entity.dart';
import 'package:meeting_app/features/messages/domain/usecases/delete_message_usecase.dart';
import 'package:meeting_app/features/messages/domain/usecases/edit_message_usecase.dart';
import 'package:meeting_app/features/messages/domain/usecases/get_new_messages_usecase.dart';
import 'package:meeting_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:meeting_app/features/messages/presentation/cubit/chat_cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final DeleteMessageUsecase deleteMessageUsecase;
  final EditMessageUsecase editMessageUsecase;
  final GetNewMessagesUsecase getNewMessagesUsecase;
  final SendMessageUsecase sendMessageUsecase;
  StreamSubscription<MessageEntity>? _messageSubscription;
  List<MessageEntity> _messages = []; // Local cache of messages
  ChatCubit(
      {required this.deleteMessageUsecase,
      required this.editMessageUsecase,
      required this.getNewMessagesUsecase,
      required this.sendMessageUsecase})
      : super(ChatInitial());
  void subscribeToNewMessages() {
    _messageSubscription = getNewMessagesUsecase.call().listen(
      (newMessage) {
        if (state is ChatLoaded) {
          emit(ChatLoaded((state as ChatLoaded).messages..add(newMessage)));
        } else if (state is ChatInitial) {
          emit(ChatLoaded([newMessage]));
        }
      },
      onError: (error) {
        print('Error receiving new message: $error');
        emit(ChatError('Failed to receive new messages.'));
      },
    );
  }

  Future<void> sendMessage(String content) async {
    if (state is ChatLoaded) {
      final newMessage = MessageEntity(
        senderId: 1, // Replace with actual user ID
        content: content,
        type: 'text', // Adjust as needed
      );
      _messages.add(newMessage);
      emit(ChatLoaded((state as ChatLoaded).messages
        ..add(newMessage))); // Optimistic update
      try {
        await sendMessageUsecase.call(newMessage);
      } catch (e) {
        print('Error sending message: $e');
        emit(ChatError('Failed to send message.'));
        // Optionally, revert the optimistic update
        _messages.remove(newMessage);
        emit(ChatLoaded(List.from(_messages)));
      }
    }
  }

  Future<void> editMessage(MessageEntity message) async {
    if (state is ChatLoaded) {
      final updatedMessages =
          _messages.map((m) => m.id == message.id ? message : m).toList();
      emit(ChatLoaded(updatedMessages)); // Optimistic update
      try {
        await editMessageUsecase.call(message);
      } catch (e) {
        print('Error editing message: $e');
        emit(ChatError('Failed to edit message.'));
        // Optionally, revert the optimistic update
        _messages = _messages
            .map((m) => m.id == message.id
                ? (state as ChatLoaded)
                    .messages
                    .firstWhere((old) => old.id == message.id)
                : m)
            .toList();
        emit(ChatLoaded(_messages));
      }
    }
  }

  Future<void> deleteMessage(int id) async {
    if (state is ChatLoaded) {
      final initialLength = _messages.length;
      _messages.removeWhere((m) => m.id == id);
      if (_messages.length < initialLength) {
        emit(ChatLoaded(List.from(_messages))); // Optimistic update
        try {
          await deleteMessageUsecase.call(id);
        } catch (e) {
          print('Error deleting message: $e');
          emit(ChatError('Failed to delete message.'));
          // Optionally, revert the optimistic update (you might need to re-fetch or store the deleted item)
        }
      }
    }
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    return super.close();
  }
}
