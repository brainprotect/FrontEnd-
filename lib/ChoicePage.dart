import 'package:flutter/material.dart';
import 'package:brain/InputPage.dart';

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