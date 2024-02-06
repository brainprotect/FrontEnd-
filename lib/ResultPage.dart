import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';

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