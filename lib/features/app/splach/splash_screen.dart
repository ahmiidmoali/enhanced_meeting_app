import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/const/app_images_const.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:meeting_app/features/app/welcome/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
            (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Image.asset(
            AppImagesConst.appIcon,
            color: AppColors.textColorIn,
            height: 300,
            width: 300,
          ),
          const Column(
            children: [
              Text(
                "let's \n hangout",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.textColorIn,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/meta.png",
                  //   color: textColor,
                  //   height: 35,
                  //   width: 35,
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "welcome",
                    style: TextStyle(
                        color: AppColors.textColorIn,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
