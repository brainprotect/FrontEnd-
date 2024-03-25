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
          child: Image.asset('assets/HeaderLogo.png'), // 이미지 경로 수정
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
