import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';
import 'package:brain/ChoicePage.dart';
import 'package:brain/ChatBotPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text('로고', textAlign: TextAlign.left),
              ),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('앱 내용')),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/map_icon.png', width: 24, height: 24),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/decision_icon.png', width: 24, height: 24),
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/decision_icon.png', width: 24, height: 24),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/chatbot_icon.png', width: 24, height: 24),
            label: '챗봇',
          ),
        ],
        onTap: (index) {
          // 탭에 따른 페이지 이동 로직
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChoicePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChoicePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatBotPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
