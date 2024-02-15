import 'package:flutter/material.dart';
import 'package:brain/InputPage.dart';
import 'package:brain/GetInformation.dart';
import 'CameraPage.dart';

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
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(24.0),
                  backgroundColor: Colors.white,
                ),
                child: Column(
                  children: [
                    Icon(Icons.article_outlined, size: 48 * 1.5, color: Colors.black), // 아이콘 색상 변경
                    const SizedBox(height: 8),
                    Text(
                      '직접 입력',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // 텍스트 색상 변경
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(24.0),
                  backgroundColor: Colors.white,
                ),
                child: Column(
                  children: [
                    Icon(Icons.camera_alt_outlined, size: 48 * 1.5, color: Colors.black),
                    const SizedBox(height: 8),
                    Text(
                      '촬영하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetInformation()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(24.0),
                  backgroundColor: Colors.white,
                ),
                child: Column(
                  children: [
                    Icon(Icons.arrow_circle_down_outlined, size: 48 * 1.5, color: Colors.black),
                    const SizedBox(height: 8),
                    Text(
                      '건강 정보\n불러오기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
