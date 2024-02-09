import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과 페이지'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
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
