import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/splach/splash_screen.dart';
import 'package:meeting_app/features/meeting/presentation/cubit/meeting/meeting_cubit.dart';
import 'package:meeting_app/features/messages/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:meeting_app/routes/on_generated_routes.dart';
import 'main_injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<MeetingCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ChatCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        onGenerateRoute: OnGeneratedRoutes.route,
        home: const SplashScreen(),
        //  routes: {
        //   "/": (BuildContext context) {
        //     return BlocBuilder<AuthCubit, AuthState>(
        //       builder: (context, state) {
        //         if (state is Authenticated) {
        //           return HomePage(uid: state.uid);
        //         } else {
        //           return const SplashScreen();
        //         }
        //       }, );
        //   }
        // },
      ),
    );
  }
}
