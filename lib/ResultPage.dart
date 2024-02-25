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
            ResultSection(title: '뇌동맥 위험도 측정 결과'),
            SizedBox(height: 20), // 각 결과 표시 영역 사이의 간격
            // 두 번째 결과 표시 영역
            ResultSection(title: '위험도에 따른 솔루션 안내'),
            SizedBox(height: 20), // 각 결과 표시 영역 사이의 간격
            // 세 번째 결과 표시 영역
            ResultSection(title: '뇌동맥류 치료에 대한 안내'),
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
    return SingleChildScrollView(
      child: Container(
        width: 300,
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
                    fontSize: 16,
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
      ),
    );
  }

  // 설명을 반환하는 함수
  String _getDescription() {
    switch (widget.title) {
      case '뇌동맥 위험도 측정 결과':
        return '의심: 뇌동맥류의 초기 증상이 나타나는 단계로, 두통, 어지러움, 시야 변화 등이 발생할 수 있습니다. 이러한 증상이 나타날 경우 반드시 의료진의 상담을 받아야 합니다.';
      case '위험도에 따른 솔루션 안내':
        return '의심일 경우: 증상이 의심스러운 경우, 즉시 의료진의 상담을 받아야 합니다. 의료진은 증상을 평가하고 적절한 검사를 통해 뇌동맥류의 가능성을 확인할 수 있습니다.';
      case '뇌동맥류 치료에 대한 안내':
        return '1. 진단: 뇌동맥류의 존재와 심각성을 확인하기 위해 진단 검사가 필요합니다. 이는 CT 스캔, MRI 또는 혈관조영술과 같은 영상검사를 포함할 수 있습니다. 2. 평가: 뇌동맥류의 크기, 위치 및 혈류에 대한 평가가 이루어집니다. 이를 통해 치료 방법을 결정할 수 있습니다. 3. 약물 치료: 일반적으로 뇌동맥류의 발생을 막기 위해 혈압 조절제, 혈액 희석제, 콜레스테롤 감소제 등의 약물이 처방될 수 있습니다. 4. 수술 치료: 심각한 뇌동맥류의 경우, 수술이 필요할 수 있습니다. 수술은 뇌동맥류를 제거하거나 뇌동맥류 주변의 혈액 순환을 복구하고 뇌 조직에 압력을 줄이는 등의 목적으로 수행될 수 있습니다. 5. 재활 및 관리: 수술 후 뇌동맥류의 관리와 회복을 위해 재활 프로그램이 필요할 수 있습니다. 이는 뇌동맥류의 재발을 예방하고 환자의 기능을 최대한 회복하는 데 도움을 줍니다.';
      default:
        return '';
    }
  }
}
