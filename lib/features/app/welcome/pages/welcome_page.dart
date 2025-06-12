import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/const/app_images_const.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:meeting_app/features/app/welcome/widgets/welcome_buttom_custom.dart';
import 'package:meeting_app/features/user/presentation/pages/user_log_in.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Image.asset(
              AppImagesConst.appIcon,
              color: AppColors.textColorIn,
              height: 300,
              width: 300,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.textColorIn,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: Column(
                children: [
                  const Text(
                    "welcome",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.textColorOut,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WelcomeButtomCustom(
                    onPressed: () {},
                    text: "Join a session",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WelcomeButtomCustom(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserLogIn(),
                          ));
                    },
                    text: "Sign In",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WelcomeButtomCustom(
                    onPressed: () {},
                    text: "Sign Up",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
