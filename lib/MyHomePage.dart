// import 'package:flutter/material.dart';
// import 'package:brain/MapPage.dart';
// import 'package:brain/ChoicePage.dart';
// import 'package:brain/ChatBotPage.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// // Pop-upPage.dart 파일이 있는 경로로 수정
//
// import 'Pop-upPage.dart';
//
// class HoverImage extends StatefulWidget {
//   //이미지에 마우스를 올렸을 경우
//   final String imagePath;
//
//   const HoverImage({Key? key, required this.imagePath}) : super(key: key);
//
//   @override
//   _HoverImageState createState() => _HoverImageState();
// }
//
// class _HoverImageState extends State<HoverImage> {
//   double opacity = 0.5; // 초기 투명도 설정
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) => setState(() => opacity = 1.0), // 마우스 호버시 투명도 100%
//       onExit: (event) => setState(() => opacity = 0.5), // 마우스가 벗어날 때 투명도 50%
//       child: Opacity(
//         opacity: opacity,
//         child: Container(
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0), // Card 모서리 둥글게
//             ),
//             child: ClipRRect(
//               // 이미지 모서리를 둥글게 처리
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 widget.imagePath,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // 메인 페이지
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: TextTheme(
//           bodyText1: TextStyle(
//               fontFamily: 'Sejonghospital'), // 예시로 bodyText1에 fontFamily를 적용
//           // 여기에 다른 텍스트 스타일들을 추가할 수 있습니다.
//         ),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF1C2541),
//           title: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyHomePage()),
//               );
//             },
//             child: Image.asset('assets/HeaderLogo.png'), // 이미지 경로 수정
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           // 전체 body에 스크롤 기능 추가
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
//                 // 위아래 마진 부여
//                 child: CarouselSlider(
//                   options: CarouselOptions(
//                     height: MediaQuery.of(context).size.height * 0.25,
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                     viewportFraction: 0.8,
//                     aspectRatio: 16 / 9,
//                     initialPage: 0,
//                   ),
//                   items: [
//                     "1. 메인페이지 - 사용법 안내 및 뇌동맥의 원인 및 위험성 설명",
//                     "2. 뇌동맥 판단 페이지 - 건강검진 제출 방법 선택(직접 작성, 촬영, 건강검진 결과 불러오기 중 선택)",
//                     "3. 뇌동맥류 검사 결과 출력 페이지 - 건강검진표를 통한 뇌동맥 여부 확인 및 결과 제공",
//                     "4. 지도 페이지 - 병원 위치 확인 및 검사 가능한 병원 찾기",
//                     "5. 챗봇 페이지 - 뇌동맥류 예측 및 관련 정보 제공",
//                     "6. 커뮤니티 페이지 - 뇌동맥류 관련 질환 및 치료 후기 공유",
//                   ].map((item) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: EdgeInsets.symmetric(horizontal: 5.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(30), // 모서리 둥글게
//                             boxShadow: [
//                               // 그림자 효과
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset:
//                                 Offset(0, 3), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Text(
//                               item,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 50.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "오늘의 퀴즈",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30.0,
//                     ),
//                     Container(
//                       width: 380,
//                       height: 200,
//                       margin: EdgeInsets.only(bottom: 20.0),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFD9D9D9),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             '뇌동맥류란?',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                           SizedBox(height: 10),
//                           GestureDetector(
//                             child: Text(
//                               '뇌정맥의 특정 부위가 꽈리나 풍선처럼 \n  부풀어 오른 뇌질환을 뇌동맥류라고 합니다.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'Sejong_hospital',
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       Future.delayed(Duration(seconds: 1), () {
//                                         Navigator.of(context).pop(true);
//                                       });
//                                       return AlertDialog(
//                                         title: Text('정답입니다.'),
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // 텍스트 여백 조정
//                                   decoration: BoxDecoration(
//                                     color: Colors.transparent, // 투명한 배경색
//                                     border: Border.all(color: Colors.transparent), // 테두리 제거
//                                   ),
//                                   child: Text(
//                                     'O',
//                                     style: TextStyle(
//
//                                       fontSize: 35, // 텍스트 크기 조정
//                                       color: Colors.black, // 텍스트 색상 지정
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                               InkWell(
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       Future.delayed(Duration(seconds: 1), () {
//                                         Navigator.of(context).pop(true);
//                                       });
//                                       return AlertDialog(
//                                         title: Text('다시 한번 생각해보세요.'),
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // 텍스트 여백 조정
//                                   decoration: BoxDecoration(
//                                     color: Colors.transparent, // 투명한 배경색
//                                     border: Border.all(color: Colors.transparent), // 테두리 제거
//                                   ),
//                                   child: Text(
//                                     'X',
//                                     style: TextStyle(
//                                       fontSize: 35, // 텍스트 크기 조정
//                                       color: Colors.black, // 텍스트 색상 지정
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//                 child: Container(
//                   width: 380,
//                   height: 220,
//                   margin: EdgeInsets.only(bottom: 20.0),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFD9D9D9),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       '우리 어플은 딥러닝 A.I를 사용하여 정확한 뇌동맥류 예측과 함께 챗봇을 활용하여 맞춤형 의료 정보서비스를 제공합니다. \n\n또한 건강검진표를 활용하여 뇌동맥류 위험군을 판단해주고, 위치 서비스를 통해 주변 병원을 추천하여 편의서비스를 제공합니다. ',
//                       style: TextStyle(fontSize: 16, fontFamily: 'Sejong'),
//                     ),
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 40.0),
//                 child: Container(
//                   width: 380,
//                   height: 220,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFD9D9D9),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       '다른 어플과 차별되는 점은 사용자 맞춤형 서비스를 강조하며, 신속하고 정확한 뇌동맥류 예측과 함께 다양한 기능을 제공하여 사용자들의 편의를 극대화하는 데에 중점을 두고 있습니다.',
//                       style: TextStyle(fontSize: 18, fontFamily: 'Sejong'),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Color(0xFF1C2541),
//           type: BottomNavigationBarType.fixed,
//           // 아이템들이 동일한 공간을 차지하도록 설정
//           selectedItemColor: Colors.white,
//           // 선택된 아이템의 색상을 검정으로 설정
//           unselectedItemColor: Colors.white,
//           // 선택되지 않은 아이템의 색상을 검정으로 설정
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/mapIcon.png'),
//                   color: Colors.white),
//               // 이미지 경로 수정
//               label: '지도',
//             ),
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/TestIcon.png'),
//                   color: Colors.white),
//               // 이미지 경로 수정
//               label: '뇌동맥 판단',
//             ),
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/CommunityIcon.png'),
//                   color: Colors.white),
//               // 이미지 경로 수정
//               label: '커뮤니티',
//             ),
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/ChatBotIcon.png'),
//                   color: Colors.white),
//               // 이미지 경로 수정
//               label: '챗봇',
//             ),
//           ],
//           onTap: (index) {
//             // 탭에 따른 페이지 이동 로직
//             switch (index) {
//               case 0:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MapPage()),
//                 );
//                 break;
//               case 1:
//               // 뇌동맥 판단 버튼을 눌렀을 때 동작
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return BrainAssessmentPopup();
//                   },
//                 );
//                 break;
//               case 2:
//               // 커뮤니티 페이지로 이동해야 하는 경우 여기에 해당 페이지로 이동하는 코드를 추가합니다.
//                 break;
//               case 3:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ChatBotPage()),
//                 );
//                 break;
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'MapPage.dart';
import 'ChoicePage.dart';
import 'ChatBotPage.dart';
import 'Pop-upPage.dart'; // 파일 이름 및 경로 수정


class HoverImage extends StatefulWidget {
  final String imagePath;

  const HoverImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isHovered ? 1.0 : 0.5,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16.0,
                child: Text(
                  '이미지 설명',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CircleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green.withOpacity(0.7),
      ),
      child: Center(
        child: Text(
          'O',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CrossIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.7),
      ),
      child: Center(
        child: Text(
          'X',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F2F5),
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
        padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              "",
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),
              ),
              SizedBox(height: 20.0),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()), // MapPage로 이동
                          );
                        },
                        style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                        child: Padding(
                        padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                            Icon(Icons.map, size: 40, color: Colors.blue),
                            SizedBox(height: 10.0),
                              Text(
                              "지도",
                              style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BrainAssessmentPopup();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                          child: Column(
                            children: [
                              Icon(Icons.assessment, size: 40, color: Colors.orange),
                              SizedBox(height: 10.0),
                              Text(
                                "뇌동맥 판단",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatBotPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                      child: Padding(
                      padding: const EdgeInsets.all(20.0),
                        child: Column(
                        children: [
                          Icon(Icons.chat, size: 40, color: Colors.green),
                          SizedBox(height: 10.0),
                          Text(
                          "챗봇",
                          style: TextStyle(fontSize: 18),
                          ),
                          ],
                        ),
                      ),
                      ),
                      ),
                  SizedBox(width: 20.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                Icon(Icons.people, size: 40, color: Colors.purple),
                                SizedBox(height: 10.0),
                                  Text(
                                  "커뮤니티",
                                  style: TextStyle(fontSize: 18),

                                  ),
                                ],
                              ),
                            ),
                        ),
                    ),
                  ],
                ),
              SizedBox(height: 50.0),
              Text(
                '오늘의 퀴즈',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '뇌동맥류란?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '뇌정맥의 특정 부위가 꽈리나 풍선처럼 부풀어 오른 뇌질환을 뇌동맥류라고 합니다.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('정답입니다.'),
                              ),
                            );
                          },
                          child: CircleIcon(),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('다시 한번 생각해보세요.'),
                              ),
                            );
                          },
                          child: CrossIcon(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
