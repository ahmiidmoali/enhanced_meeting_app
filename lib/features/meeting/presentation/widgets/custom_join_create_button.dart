import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';

class CustomJoinCreateButton extends StatefulWidget {
  final void Function()? onPressed;
  final void Function()? change;
  final String textOnTure;
  final String textOnFalse;
  final bool isChange;
  const CustomJoinCreateButton(
      {super.key,
      required this.onPressed,
      required this.textOnTure,
      required this.textOnFalse,
      required this.isChange,
      this.change});

  @override
  State<CustomJoinCreateButton> createState() => _CustomJoinCreateButtonState();
}

class _CustomJoinCreateButtonState extends State<CustomJoinCreateButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          widget.isChange ? widget.textOnTure : widget.textOnFalse,
          style: const TextStyle(
              fontSize: 20, color: AppColors.textColorIn, height: 2),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
