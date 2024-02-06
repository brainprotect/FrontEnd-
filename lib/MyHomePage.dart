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
                child: const Text(
                  '로고',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // 지도 버튼
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // 버튼을 눌렀을 때의 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('앱 내용'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // IconButton(
            //   icon: const Icon(Icons.arrow_back),
            //   onPressed: () {
            //     // 뒤로가기인데 메인페이지에서는 필요없어서 고민중
            //     // 만들고 보니 작동할 일이 없어서 주석처리 해둠gi
            //   },
            // ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChoicePage()),
                );
              },
              child: const Text('뇌동맥 판단 버튼'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatBotPage()),
                );
              },
              child: const Text('챗봇 버튼'),

            ),
          ],
        ),
      ),
    );
  }
}
