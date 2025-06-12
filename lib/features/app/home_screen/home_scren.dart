import 'package:flutter/material.dart';
import 'package:meeting_app/features/history/presentation/pages/history_page.dart';
import 'package:meeting_app/features/meeting/presentation/pages/home_page.dart';
import 'package:meeting_app/features/schedule/presentation/pages/schedule_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentpage = 0;
  List<Widget> pages = [
    const HomePage(),
    const SchedulePage(),
    const HistoryPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    if (currentpage != 0) {
                      setState(() {
                        currentpage = 0;
                      });
                    }
                  },
                  icon: const Icon(Icons.home)),
              IconButton(
                  onPressed: () {
                    if (currentpage != 1) {
                      setState(() {
                        currentpage = 1;
                      });
                    }
                  },
                  icon: const Icon(Icons.person)),
              IconButton(
                  onPressed: () {
                    if (currentpage != 2) {
                      setState(() {
                        currentpage = 2;
                      });
                    }
                  },
                  icon: const Icon(Icons.settings))
            ],
          ),
        ),
        body: pages.elementAt(currentpage));
  }
}
