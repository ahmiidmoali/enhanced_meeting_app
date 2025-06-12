import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/theme/style.dart';

class CustomJoinCreateSwitch extends StatefulWidget {
  final Function(bool isUploading)? onComplete;
  const CustomJoinCreateSwitch({super.key, this.onComplete});

  @override
  State<CustomJoinCreateSwitch> createState() => _CustomJoinCreateSwitchState();
}

class _CustomJoinCreateSwitchState extends State<CustomJoinCreateSwitch> {
  bool joinMeeting = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () {
            if (joinMeeting == false) {
              setState(() {
                joinMeeting = true;
                widget.onComplete!(true);
              });
            }
          },
          child: Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                border: joinMeeting == true
                    ? Border(
                        bottom: BorderSide(
                            width: 4, color: AppColors.backgroundColor))
                    : null),
            child: Text(
              "JOIN",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: joinMeeting == false
                      ? Colors.black
                      : AppColors.backgroundColor),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            if (joinMeeting == true) {
              joinMeeting = false;
              widget.onComplete!(false);
              setState(() {
                // currentCode = "XYZ5s88se";
              });
            }
          },
          child: Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                border: joinMeeting == false
                    ? Border(
                        bottom: BorderSide(
                            width: 4, color: AppColors.backgroundColor))
                    : null),
            child: Text(
              "CREATE",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: joinMeeting == true
                      ? Colors.black
                      : AppColors.backgroundColor),
            ),
          ),
        ),
      ],
    );
  }
}
