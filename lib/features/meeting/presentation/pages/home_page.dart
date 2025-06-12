import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/const/app_images_const.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:meeting_app/features/app/welcome/widgets/welcome_buttom_custom.dart';
import 'package:meeting_app/features/meeting/domain/entities/meeting_entity.dart';
import 'package:meeting_app/features/meeting/presentation/cubit/meeting/meeting_cubit.dart';
import 'package:meeting_app/features/meeting/presentation/cubit/meeting/meeting_state.dart';
import 'package:meeting_app/features/meeting/presentation/pages/meeting_page.dart';
import 'package:meeting_app/features/meeting/presentation/widgets/custom_join_create_switch.dart';
import 'package:meeting_app/features/meeting/presentation/widgets/custom_swipe_button.dart';
import 'package:meeting_app/features/meeting/presentation/widgets/custom_text_form_field_join_code.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/global/functions/validinput.dart';
import '../widgets/custom_join_create_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController joiningCodeController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String generateShortUuid(int length) {
    final uuid = const Uuid();
    final fullUuid = uuid.v1(); // Generate a v4 (random) UUID
    if (length >= fullUuid.length) {
      return fullUuid;
    }
    return fullUuid.substring(0, length);
  }

  bool joinMeeting = true;
  void generateUid() {
    if (joinMeeting == true) {
      joiningCodeController.clear();
    } else if (joinMeeting == false) {
      joiningCodeController.text = generateShortUuid(8);
    }
  }

  @override
  void initState() {
    joiningCodeController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formstate,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Image.asset(
                alignment: Alignment.center,
                AppImagesConst.letstalkImage,
                height: 300,
                width: 300,
              ),
            ),
            //Join Create buttons
            CustomJoinCreateSwitch(
              onComplete: (isUploading) {
                joinMeeting = isUploading;
                generateUid();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextFormFieldJoinCode(
                vaild: (value) {
                  return validInput(value!, 7, 11, "nothing");
                },
                onChanged: (value) {
                  joiningCodeController.text = value;
                },
                hint: "",
                fillColor: AppColors.textColorIn,
                icon: Icons.share,
                isNumber: false,
                lable: "meeting code",
                onPressedIcon: () {},
                myController: joiningCodeController,
              ),
            ),
            BlocListener<MeetingCubit, MeetingState>(
                listener: (context, state) {
                  print(state);
                },
                child: CustomJoinCreateButton(
                    isChange: joinMeeting,
                    onPressed: () {
                      _confirmJoingingOrCreating();
                    },
                    textOnTure: "Join Now",
                    textOnFalse: "Start Now")
                //  CustomSwipeButton(
                //   onSwipe: () {
                //     _confirmJoingingOrCreating();
                //   },
                // ),
                )
          ],
        ),
      ),
    );
  }

  void _joinMeeting() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      BlocProvider.of<MeetingCubit>(context).joinMeeting(MeetingEntity(
          meetingId: joiningCodeController.text,
          memberName: "membername",
          memberProfileUrl: ""));
    }
  }

  void _createMeeting() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      BlocProvider.of<MeetingCubit>(context).createMeeting(MeetingEntity(
          meetingId: joiningCodeController.text,
          adminName: "adminname",
          adminProfileUrl: ""));
    }
  }

  _confirmJoingingOrCreating() {
    if (joinMeeting == true) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MeetingPage(),
      ));
      // _joinMeeting();
    } else if (joinMeeting == false) {
      _createMeeting();
    }
  }
}
