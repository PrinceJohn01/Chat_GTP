import 'package:chat_gtp/providers/models_provider.dart';
import 'package:chat_gtp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ModelsProvider(),),
      ],
      child: MaterialApp(
        title: 'Prince ChatGTP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
                appBarTheme: AppBarTheme(color: cardColor,
                )
        ),
        home: const ChatScreen(),
      ),
    );
  }
}

