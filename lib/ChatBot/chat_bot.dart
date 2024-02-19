import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      

      home: ChatGPTScreen(),
    );
  }
}
