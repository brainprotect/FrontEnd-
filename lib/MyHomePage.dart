import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';
import 'package:brain/ChoicePage.dart';
import 'package:brain/ChatBotPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Pop-upPage.dart';

class HoverImage extends StatefulWidget {
  //이미지에 마우스를 올렸을 경우
  final String imagePath;

  const HoverImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  double opacity = 0.5; // 초기 투명도 설정

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => opacity = 1.0), // 마우스 호버시 투명도 100%
      onExit: (event) => setState(() => opacity = 0.5), // 마우스가 벗어날 때 투명도 50%
      child: Opacity(
        opacity: opacity,
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Card 모서리 둥글게
            ),
            child: ClipRRect(
              // 이미지 모서리를 둥글게 처리
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 메인 페이지
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C2541),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          child: Image.asset('../assets/HeaderLogo.png'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // 전체 body에 스크롤 기능 추가
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 80.0),
              // 위아래 마진 부여
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.25,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                ),
                items: [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30), // 모서리 둥글게
                          boxShadow: [
                            // 그림자 효과
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "오늘의 퀴즈",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 380,
                    height: 180,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                width: 380,
                height: 220,
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                width: 380,
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1C2541),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('mapIcon.png'), color: Colors.white),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('TestIcon.png'), color: Colors.white),
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('CommunityIcon.png'), color: Colors.white),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('ChatBotIcon.png'), color: Colors.white),
            label: '챗봇',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
              break;
            case 1:
            // 뇌동맥 판단 버튼을 눌렀을 때 동작
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BrainAssessmentPopup();
                },
              );
              break;

            case 2:
            // Add navigation to community page
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
