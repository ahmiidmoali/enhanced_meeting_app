import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1.0,
              ),
            ),
            child: ListTile(
              trailing: GestureDetector(
                onTap: () {
                  print("rejoin a session");
                },
                child: const Text(
                  "REJOIN",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColorIn),
                ),
              ),
              title: const Text(
                "dsc5f4gdge",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColorIn),
              ),
              subtitle: const Text(
                "last joined about 1 hour",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColorIn),
              ),
            ),
          );
        },
      ),
    );
  }
}
