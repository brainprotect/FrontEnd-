import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'ChatBotPage.dart';
import 'ChoicePage.dart';
import 'InputPage.dart';
import 'MapPage.dart';
import 'MyHomePage.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Uint8List> _userImages = [];

  Color? cameraButtonColor = Color(0xFFD9D9D9);
  Color? galleryButtonColor = Color(0xFFD9D9D9);
  Color? nextButtonColor = Color(0xFFD9D9D9);

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
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          child: Image.asset('assets/HeaderLogo.png'), // 이미지 경로 수정
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
                        // primary: cameraButtonColor,
                        elevation: 7, // 음영 높이 설정
                      ),
                      onHover: (isHovering) {
                        setState(() {
                          cameraButtonColor = isHovering ? Color(0xFF6C63FE) : Color(0xFFD9D9D9);
                        });
                      },
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
                        // primary: galleryButtonColor,
                        elevation: 7, // 음영 높이 설정
                      ),
                      onHover: (isHovering) {
                        setState(() {
                          galleryButtonColor = isHovering ? Color(0xFF6C63FE) : Color(0xFFD9D9D9);
                        });
                      },
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
                // primary: nextButtonColor,
                elevation: 7, // 음영 높이 설정
              ),
              onHover: (isHovering) {
                setState(() {
                  nextButtonColor = isHovering ? Color(0xFF6C63FE) : Color(0xFFD9D9D9);
                });
              },
              child: Text(
                '다음 단계로',
                style: TextStyle(color: Colors.white), // 흰색 글자색
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C2541),
        type: BottomNavigationBarType.fixed, // 아이템들이 동일한 공간을 차지하도록 설정
        selectedItemColor: Colors.white, // 선택된 아이템의 색상을 검정으로 설정
        unselectedItemColor: Colors.white, // 선택되지 않은 아이템의 색상을 검정으로 설정
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/mapIcon.png'), color: Colors.white), // 이미지 경로 수정
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/TestIcon.png'), color: Colors.white), // 이미지 경로 수정
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/CommunityIcon.png'), color: Colors.white), // 이미지 경로 수정
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/ChatBotIcon.png'), color: Colors.white), // 이미지 경로 수정
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
