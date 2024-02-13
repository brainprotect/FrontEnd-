import 'package:flutter/material.dart';
import 'package:brain/InputPage.dart';
import 'package:brain/GetInformation.dart';

import 'CameraPage.dart';

// 위험군 페이지
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputPage()),
                  );
                },
                child: const Text('직접 입력'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraPage()), // 'const' 제거
                  );
                },
                child: const Text('촬영하기'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // 세 번째 버튼 눌렀을 때 동작
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetInformation()),
                  );
                },
                child: const Text('건강 정보 불러오기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}