import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

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
            //     // 만들고 보니 작동할 일이 없어서 주석처리 해둠
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

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('지도 페이지'),
      ),
      body: const Center(
        child: Text('여기에 지도 표시'),
      ),
    );
  }
}


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

//위험군 페이지
class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위험군 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InputPage()),
                    );
                  },
                  child: const Text('직접 입력'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 두 번째 버튼 눌렀을 때 동작
                  },
                  child: const Text('촬영하기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//직접입력페이지
class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('직접 입력 페이지'),
      ),
      body: const Center(
        child: Text('문진표 표시'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultPage()),
                );
              },
              child: const Text('결과보기'),
            ),
          ],
        ),
      ),
    );
  }
}

//결과 페이지
class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과 페이지'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            // 홈으로 이동하는 동작
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              // 지도 페이지로 이동하는 동작
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('여기에 결과 표시.'),
      ),
    );
  }
}