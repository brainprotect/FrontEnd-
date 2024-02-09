import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';

import 'ChatBotPage.dart';
import 'ChoicePage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('결과 페이지'),
      //   leading: IconButton(
      //     icon: const Icon(Icons.home),
      //     onPressed: () {
      //       Navigator.popUntil(context, ModalRoute.withName('/'));
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.map),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => const MapPage()),
      //         );
      //       },
      //     ),
      //   ],
      // ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 첫 번째 결과 표시 영역
            ResultSection(title: '뇌동맥 위험성'),
            SizedBox(height: 20), // 각 결과 표시 영역 사이의 간격
            // 두 번째 결과 표시 영역
            ResultSection(title: '뇌동맥 가능성'),
            SizedBox(height: 20), // 각 결과 표시 영역 사이의 간격
            // 세 번째 결과 표시 영역
            ResultSection(title: '필요성'),
          ],
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
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

class ResultSection extends StatefulWidget {
  final String title;

  const ResultSection({Key? key, required this.title}) : super(key: key);

  @override
  _ResultSectionState createState() => _ResultSectionState();
}

class _ResultSectionState extends State<ResultSection> {
  // 설명을 보여주는 변수
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200], // 배경 색상 설정
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 결과 텍스트와 + 아이콘
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Icon(showDescription ? Icons.remove : Icons.add),
                onPressed: () {
                  setState(() {
                    // 설명 보이기/숨기기 토글
                    showDescription = !showDescription;
                  });
                },
              ),
            ],
          ),
          // 설명 텍스트 (showDescription이 true일 때만 보임)
          if (showDescription)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _getDescription(), // 변경된 설명을 가져옴
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // 설명을 반환하는 함수
  String _getDescription() {
    switch (widget.title) {
      case '뇌동맥 위험성':
        return '여기에 설명1을 표시합니다.';
      case '뇌동맥 가능성':
        return '여기에 설명2를 표시합니다.';
      case '필요성':
        return '여기에 설명3을 표시합니다.';
      default:
        return '';
    }
  }
}
