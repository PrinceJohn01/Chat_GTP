import 'package:chat_gtp/constants/constant.dart';
import 'package:chat_gtp/services/assets_manager.dart';
import 'package:chat_gtp/widgets/chat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AssetsManager.openaiLogo),
      ),
      title: const Text('Prince ChatGPT'),actions: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white,))],
      ),
      body:SafeArea(child: Column(children: [
        Flexible(
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index){
            return const ChatWidget();
          }),
        ),
        if(_isTyping) ... [
           const SpinKitThreeBounce(
             color: Colors.white,
             size: 8,
               ),
          const SizedBox(height: 15,),
          Material(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                    onSubmitted: (value){
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: 'How Can I Help You',
                        hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.send, color: Colors.white,))
                   ],
                  ),
            ),
          ),
             ]
           ],
         ),
      ),
    );
  }
}