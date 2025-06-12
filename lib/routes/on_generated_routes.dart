import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/const/app_page_const.dart';
import 'package:meeting_app/features/app/home_screen/home_scren.dart';
import 'package:meeting_app/features/app/splach/splash_screen.dart';
import 'package:meeting_app/features/meeting/presentation/pages/meeting_page.dart';

class OnGeneratedRoutes {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    switch (name) {
      case AppPageConst.welcomePage:
        {
          return materialPageBuilder(const SplashScreen());
        }
      case AppPageConst.homeScreen:
        {
          return materialPageBuilder(const HomeScreen());
        }
      case AppPageConst.meetingPage:
        {
          return materialPageBuilder(const MeetingPage());
        }

      // case PageConst.settingsPage:
      //   {
      //     if (args is String) {
      //       return materialPageBuilder(SettingsPage(uid: args));
      //     } else {
      //       return materialPageBuilder(const ErrorPage());
      //     }
      //   }
    }
    return materialPageBuilder(const ErrorPage());
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}
