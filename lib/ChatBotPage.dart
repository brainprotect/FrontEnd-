import 'package:flutter/material.dart';

//챗봇 페이지
class ChatBotPage extends StatelessWidget {
  const ChatBotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('챗봇 페이지'),
      ),
      body: const Center(
        child: Text('여기에 챗봇 대화 표시.'),
      ),
    );
  }
}