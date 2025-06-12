import 'package:get_it/get_it.dart';
import 'package:meeting_app/features/app/services/network_services.dart';
import 'package:meeting_app/features/meeting/meeting_injection_container.dart';
import 'package:meeting_app/features/messages/messages_injection_container.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<NetworkServices>(
    () => NetworkServicesImp(),
  );

  await meetingInjectionContainer();
  await messagesInjectionContainer();
}
