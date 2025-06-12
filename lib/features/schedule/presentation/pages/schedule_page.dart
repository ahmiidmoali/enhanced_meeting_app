import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:meeting_app/features/schedule/presentation/widgets/custom_schedule_listtile.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: MaterialButton(
        onPressed: () {},
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
              border: Border.all(
                color: Colors.grey, // Border color
                width: 3,
              )),
          child: const Icon(
            Icons.add,
            size: 30,
            color: AppColors.textColorIn,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const CustomScheduleListtile();
        },
      ),
    );
  }
}
