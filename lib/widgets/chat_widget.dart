import 'package:chat_gtp/constants/constant.dart';
import 'package:chat_gtp/services/assets_manager.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Material(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                  AssetsManager.userImage,
                  height: 30,
                  width: 30,
              ),
              const Text('Here will be the msg'),
            ],
          ),
        ),
      )
     ],
    );
  }
}
