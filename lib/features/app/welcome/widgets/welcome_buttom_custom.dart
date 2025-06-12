import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';

class WelcomeButtomCustom extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const WelcomeButtomCustom(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: AppColors.textColorIn, height: 2),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
