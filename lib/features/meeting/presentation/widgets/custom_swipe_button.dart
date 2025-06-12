import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:swipe_to/swipe_to.dart';

class CustomSwipeButton extends StatelessWidget {
  final VoidCallback? onSwipe;

  const CustomSwipeButton({super.key, required this.onSwipe});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SwipeTo(
              offsetDx: 5,
              iconOnRightSwipe: Icons.arrow_circle_right_rounded,
              onRightSwipe: (details) {
                onSwipe?.call();
              },
              child: const Icon(
                size: 35,
                Icons.arrow_circle_right_rounded,
                color: AppColors.textColorIn,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            const Text(
              "Swipe To Confirm",
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ));
  }
}
