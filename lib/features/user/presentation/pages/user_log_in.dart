import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/home_screen/home_scren.dart';
import 'package:meeting_app/features/app/const/app_images_const.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:meeting_app/features/app/welcome/widgets/welcome_buttom_custom.dart';
import 'package:meeting_app/features/user/presentation/widgets/user_log_in/customtextformfieldauth.dart';

class UserLogIn extends StatefulWidget {
  const UserLogIn({super.key});

  @override
  State<UserLogIn> createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogIn> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Form(
          key: formstate,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
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
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFormAuth(
                      fillColor: AppColors.textColorIn,
                      hint: "Email",
                      icon: Icons.email_outlined,
                      isNumber: false,
                      myController: emailTextController,
                      lable: "Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFormAuth(
                      fillColor: AppColors.textColorIn,
                      hint: "Password",
                      icon: Icons.password_outlined,
                      isNumber: false,
                      myController: passwordTextController,
                      lable: "Password",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WelcomeButtomCustom(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                      },
                      text: "Sign In",
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
      ),
    );
  }
}
