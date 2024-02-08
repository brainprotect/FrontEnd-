import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';
import 'package:brain/ChoicePage.dart';
import 'package:brain/ChatBotPage.dart';

// 메인 페이지
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 제목을 가운데 정렬합니다.
          children: [
            IconButton(
              icon: Image.asset('MainLogo.png'), // 로고 이미지
              onPressed: () {
                // 로고를 클릭했을 때 실행될 동작
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('UserIcon.png'), // 사용자 아이콘 이미지
            onPressed: () {
              // 사용자 아이콘을 클릭했을 때 실행될 동작을 여기에 작성합니다.
            },
          ),
        ],
      ),
      body: const Center(child: Text('앱 내용')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 아이템들이 동일한 공간을 차지하도록 설정
        selectedItemColor: Colors.black, // 선택된 아이템의 색상을 검정으로 설정
        unselectedItemColor: Colors.black, // 선택되지 않은 아이템의 색상을 검정으로 설정
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('mapIcon.png'), color: Colors.black),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('TestIcon.png'), color: Colors.black),
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('CommunityIcon.png'), color: Colors.black),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('ChatBotIcon.png'), color: Colors.black),
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
            // 커뮤니티 페이지로 이동해야 하는 경우 여기에 해당 페이지로 이동하는 코드를 추가합니다.
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
