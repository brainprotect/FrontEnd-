import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'InputPage.dart';
import 'MyHomePage.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Uint8List> _userImages = [];

  // 이미지를 가져오는 함수
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _userImages.add(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1C2541),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          child: Text(
            'BRAINPROTECT',
            style: TextStyle(color: Color(0xFFACD0EF)),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 촬영하기 버튼
                Column(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: Size(200, 300),
                        primary: Colors.grey[300], // 밝은 회색 배경색
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // 카메라 아이콘
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Image.asset(
                              'assets/img_camera2.png', // 이미지 파일 경로
                              width: 250,
                              height: 250,
                            ),
                          ),
                          // 버튼 텍스트
                          Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: Text(
                              "촬영하기",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // 버튼 사이 간격 조절
                // 이미지 제출하기 버튼
                Column(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: Size(200, 300),
                        primary: Colors.grey[300], // 밝은 회색 배경색
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // 갤러리 아이콘
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Image.asset(
                              'assets/img_gallery2.png', // 이미지 파일 경로
                              width: 250,
                              height: 250,
                            ),
                          ),
                          // 버튼 텍스트
                          Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: Text(
                              "이미지 제출하기",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 45),
            // "다음 단계로" 버튼
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20), // 버튼 크기 조절
                primary: Colors.grey[300], // 밝은 회색 배경색
              ),
              child: Text(
                '다음 단계로',
                style: TextStyle(color: Colors.white), // 흰색 글자색
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1C2541), // 하단 앱바 배경색
        child: SizedBox(height: 50), // 높이 조절
      ),
    );
  }
}
