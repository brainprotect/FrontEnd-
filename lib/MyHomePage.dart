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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // AppBar의 높이를 80.0으로 설정
        child: AppBar(
          title: Text(''),
          centerTitle: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                // 상단 패딩 조정
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 가로 방향으로 중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // 세로 방향으로 중앙 정렬
                  children: [
                    Expanded(
                      // 로고가 중앙에 오도록 확장
                      child: Center(
                        child: IconButton(
                          icon: Image.asset('MainLogo.png'),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    IconButton(
                      // 사용자 아이콘은 오른쪽에 위치
                      icon: Image.asset('UserIcon.png'),
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.1), // 세로 패딩 조정
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            // AppBar의 actions 속성은 여전히 사용할 수 있지만, 이 예제에서는 사용하지 않음
            SizedBox(width: 48), // IconButton의 기본 크기와 동일한 공간 확보
          ],
        ),
      ),
      body: SingleChildScrollView(
        // 전체 body에 스크롤 기능 추가
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("국민건강보험"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('정부24'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('한국건강관리협회'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                          boxShadow: [
                            // 그림자 효과
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          // Container 내부의 모든 것들도 둥글게 처리
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                          child: Center(
                            child:
                                Text('박스 $i', style: TextStyle(fontSize: 16.0)),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(4, (index) {
                  return HoverImage(
                    imagePath: 'mainIntro${index + 1}.png',
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 아이템들이 동일한 공간을 차지하도록 설정
        selectedItemColor: Colors.black,
        // 선택된 아이템의 색상을 검정으로 설정
        unselectedItemColor: Colors.black,
        // 선택되지 않은 아이템의 색상을 검정으로 설정
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('mapIcon.png')),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('TestIcon.png')),
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('CommunityIcon.png')),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('ChatBotIcon.png')),
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
            // 뇌동맥 판단 버튼을 눌렀을 때 동작
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BrainAssessmentPopup();
                },
              );
              break;
            case 2:
              // 커뮤니티 페이지로 이동해야 하는 경우 여기에 해당 페이지로 이동하는 코드를 추가합니다.
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatBotPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
