import 'package:flutter/material.dart';
import 'package:brain/ResultPage.dart';

//직접 입력 페이지

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