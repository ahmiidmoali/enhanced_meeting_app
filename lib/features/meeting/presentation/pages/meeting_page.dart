import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/features/app/const/app_images_const.dart';
import 'package:meeting_app/features/app/theme/style.dart';
import 'package:meeting_app/features/messages/domain/entities/message_entity.dart';
import 'package:meeting_app/features/messages/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:meeting_app/features/messages/presentation/cubit/chat_cubit/chat_state.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  // final WebSocketChannel _channel = WebSocketChannel.connect(
  //   Uri.parse('ws://10.0.2.2:8088/web_socket_meeting/websocket_server.php'),
  // );

  // List<Map<String, dynamic>> _messages = [];
  // sendMessage() {
  //   _channel.sink.add({
  //     'new_message': 'new_message',
  //     'messages_sender_id': 'messages_sender_id',
  //     'messages_reciever_id': 'messages_reciever_id',
  //     'message_content': 'message_content',
  //     'messages_type': 'messages_type',
  //     'messages_profile_url': 'messages_profile_url',
  //     'messages_sender_name': 'messages_sender_name',
  //     'messages_meeting_id': 'messages_meeting_id'
  //   });
  // }

  @override
  void initState() {
    // _channel.stream.listen((data) {
    //   print(" web socket data $data");
    //   setState(() {
    //     _messages.add(json.decode(data));
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.bottomCenter,
                color: AppColors.backgroundColor,
                height: 80,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _MeetingDisc(
                      title: "meeting code",
                      subTitle: "sqw7dsa4w7",
                    ),
                    _MeetingDisc(
                      title: "meeting Admin",
                      subTitle: "ahmed",
                    ),
                    _MeetingDisc(
                      title: "Guest",
                      subTitle: "ali",
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.textColorIn,
                  child: Image.asset(AppImagesConst.profileOther),
                ),
              ),
            ],
          ),
          Positioned(
              left: 0,
              top: 85,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    border: Border.all(color: AppColors.textColorIn),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                height: 150,
                width: 200,
                child: Image.asset(AppImagesConst.profileDefault),
              )),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MeetingButton(
                    icon: Icons.chat,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => ChatPageBottomSheet());
                    },
                    title: "chat",
                  ),
                  _MeetingButton(
                    icon: Icons.mic_off_outlined,
                    onPressed: () {},
                    title: "Mic On",
                  ),
                  _MeetingButton(
                    icon: Icons.camera_alt_outlined,
                    onPressed: () {},
                    title: "Camera Off",
                  ),
                  _MeetingButton(
                    icon: Icons.exit_to_app,
                    onPressed: () {},
                    title: "End Meeting",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class _MeetingButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final IconData? icon;

  const _MeetingButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          iconSize: 30,
          icon: Icon(
            icon,
            color: AppColors.backgroundColor,
          ),
        ),
        Text(
          title,
          style: const TextStyle(color: AppColors.backgroundColor),
        )
      ],
    );
  }
}

class _MeetingDisc extends StatelessWidget {
  final String title;
  final String subTitle;

  const _MeetingDisc({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 15, color: AppColors.textColorIn),
        )
      ],
    );
  }
}

class ChatPageBottomSheet extends StatefulWidget {
  const ChatPageBottomSheet({
    super.key,
  });

  @override
  State<ChatPageBottomSheet> createState() => _ChatPageBottomSheetState();
}

class _ChatPageBottomSheetState extends State<ChatPageBottomSheet> {
  late TextEditingController _messageController;
  final ScrollController _scrollController = ScrollController();
  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      BlocProvider.of<ChatCubit>(context).sendMessage(text);
      _messageController.clear();
      // Optionally, scroll to the bottom after sending
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   _scrollController.animateTo(
      //     _scrollController.position.maxScrollExtent,
      //     duration: const Duration(milliseconds: 300),
      //     curve: Curves.easeOut,
      //   );
      // });
    }
  }

  @override
  void initState() {
    _messageController = TextEditingController();
    BlocProvider.of<ChatCubit>(context).subscribeToNewMessages();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is ChatLoaded) {
                final messages = state.messages;
                return Container(
                  height: 300,
                  color: AppColors.backgroundColor,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Text("${messages[index]} ");
                    },
                  ),
                );
              }
              return Container(
                  height: 300,
                  color: AppColors.backgroundColor,
                  child: Center(child: Text("nothinga")));
            },
          ),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _messageController,
                  )),
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        _sendMessage();
                      },
                      icon: Icon(Icons.send)))
            ],
          )
        ],
      ),
    );
  }
}
