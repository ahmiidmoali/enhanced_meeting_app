import 'package:meeting_app/features/meeting/data/data_sources/meeting_remote_data_source.dart';
import 'package:meeting_app/features/meeting/data/data_sources/meeting_remote_data_source_imp.dart';
import 'package:meeting_app/features/meeting/data/repository/meeting_repositpry_imp.dart';
import 'package:meeting_app/features/meeting/domain/repository/meeting_repository.dart';
import 'package:meeting_app/features/meeting/domain/usecases/create_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/domain/usecases/end_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/domain/usecases/join_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/domain/usecases/start_meeting_usecase.dart';
import 'package:meeting_app/features/meeting/presentation/cubit/meeting/meeting_cubit.dart';
import 'package:meeting_app/main_injection_container.dart';

Future<void> meetingInjectionContainer() async {
  String uid = "";
//cubit
  sl.registerFactory<MeetingCubit>(
    () => MeetingCubit(
        createMeetingUsecase: sl.call(),
        endMeetingUsecase: sl.call(),
        joinMeetingUsercase: sl.call(),
        startMeetingUsecase: sl.call()),
  );
//usecases
  sl.registerLazySingleton<CreateMeetingUsecase>(
    () => CreateMeetingUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<EndMeetingUsecase>(
    () => EndMeetingUsecase(repository: sl.call()),
  );
  sl.registerLazySingleton<JoinMeetingUsercase>(
    () => JoinMeetingUsercase(repository: sl.call()),
  );
  sl.registerLazySingleton<StartMeetingUsecase>(
    () => StartMeetingUsecase(repository: sl.call()),
  );
//data&repository
  sl.registerLazySingleton<MeetingRepository>(
    () => MeetingRepositpryImp(remoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<MeetingRemoteDataSource>(
    () => MeetingRemoteDataSourceImp(networkServices: sl.call(), uid: uid),
  );
}
