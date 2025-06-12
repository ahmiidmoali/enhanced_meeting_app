import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';

class CustomScheduleListtile extends StatelessWidget {
  const CustomScheduleListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _CustomScheduleSmallText(
                text: "${DateTime.now()}",
              ),
              const Spacer(),
              const _CustomScheduleSmallText(
                text: "30 mins",
              ),
            ],
          ),
          const Text(
            "dsc5f4gdge",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textColorIn),
          ),
          const _CustomScheduleSmallText(
            text: "last joined about 1 hour",
          ),
          Row(
            children: [
              const Spacer(),
              _CustomScheduleMaterialButton(
                onPressed: () {},
                text: "Share",
                icon: Icons.share,
              ),
              _CustomScheduleMaterialButton(
                onPressed: () {},
                text: "Join",
                icon: Icons.video_call_outlined,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomScheduleMaterialButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onPressed;
  const _CustomScheduleMaterialButton(
      {required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textColorIn),
          )
        ],
      ),
    );
  }
}

class _CustomScheduleSmallText extends StatelessWidget {
  final String text;
  const _CustomScheduleSmallText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: AppColors.textColorIn),
    );
  }
}
