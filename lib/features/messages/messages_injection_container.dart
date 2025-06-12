import 'package:meeting_app/features/messages/data/data_sources/websocket_message_data_source.dart';
import 'package:meeting_app/features/messages/data/data_sources/websocket_message_data_source_imp.dart';
import 'package:meeting_app/features/messages/data/repository/message_repository_imp.dart';
import 'package:meeting_app/features/messages/domain/repository/messages_repository.dart';
import 'package:meeting_app/features/messages/domain/usecases/delete_message_usecase.dart';
import 'package:meeting_app/features/messages/domain/usecases/edit_message_usecase.dart';
import 'package:meeting_app/features/messages/domain/usecases/get_new_messages_usecase.dart';
import 'package:meeting_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:meeting_app/features/messages/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:meeting_app/main_injection_container.dart';

Future<void> messagesInjectionContainer() async {
//cubit
  sl.registerFactory<ChatCubit>(() => ChatCubit(
      deleteMessageUsecase: sl.call(),
      editMessageUsecase: sl.call(),
      getNewMessagesUsecase: sl.call(),
      sendMessageUsecase: sl.call()));
//usecases
  sl.registerLazySingleton<SendMessageUsecase>(
    () => SendMessageUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<EditMessageUsecase>(
    () => EditMessageUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<DeleteMessageUsecase>(
    () => DeleteMessageUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<GetNewMessagesUsecase>(
    () => GetNewMessagesUsecase(repository: sl.call()),
  );

//data&repository

  sl.registerLazySingleton<WebSocketMessageDataSource>(
    () => WebSocketMessageDataSourceImp(
        Uri.parse('ws://10.0.2.2:21/web_socket_meeting/websocket_server.php')),
  );
  sl.registerLazySingleton<MessageRepository>(
    () => MessageRepositoryImp(sl.call()),
  );
}
