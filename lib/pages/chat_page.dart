import 'package:brain/consts.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class  ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final openAI = OpenAI.instance.build(
      token: OpenAI_API_key,
      baseOption: HttpSetup(
          receiveTimeout:  const Duration(
            seconds: 5,)),
    enableLog: true,
  );

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Yongjin', lastName: 'Jung');
  final ChatUser _gptChatUser =
    ChatUser(id: '2', firstName: 'Chat', lastName: 'Bot');
  List<ChatMessage> _messages = <ChatMessage>[];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 166, 126, 1),
          title: const Text(
                '뇌동맥 챗봇',
                  style: TextStyle(
                  color: Colors.white,
            ),
      )),
    body: DashChat(currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Color.fromRGBO(3, 150, 140, 1)
        ),
        onSend: (ChatMessage m){
      getChatResponse(m);
        },
        messages: _messages)
    );
  }
  Future<void> getChatResponse(ChatMessage m) async{
    setState(() {
      _messages.insert(0, m);
    });
    List<Messages> messagesHistory = _messages.reversed.map((m) =>
    m.user == _currentUser
        ? Messages(role: Role.user, content: m.text)
        : Messages(role: Role.assistant, content: m.text)
    ).toList();
    final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: messagesHistory, maxToken: 200,
    );
    try {
      final response = await openAI.onChatCompletion(request: request);
      for (var element in response!.choices) {
        if (element.message != null) {
          setState(() {
            _messages.insert(0, ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content),
            );
          });
        }
      }
    } catch (e) {
      // 에러 처리 로직 (예: 사용자에게 알림)
      print("An error occurred: $e");
    }
  }
}

