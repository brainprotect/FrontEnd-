import 'package:flutter/material.dart';
import 'CameraPage.dart';
import 'InputPage.dart';
import 'GetInformation.dart';
import 'MyHomePage.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: ChoicePage(),
    );
  }
}

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2541),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C2541),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          child: Image.asset('assets/HeaderLogo.png'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          // 화면에서 100%
          height: MediaQuery.of(context).size.height * 1,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          // 상단 여백 추가
          decoration: BoxDecoration(
            color: Colors.white, // 배경색을 흰색으로 설정
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ), // 위쪽 부분만 border radius를 적용
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                // inner shadow의 색상 및 투명도 설정
                spreadRadius: -5,
                // 퍼지는 정도, 음수값을 주어 안쪽으로 퍼지게 합니다.
                blurRadius: 10,
                // blur 정도
                offset: Offset(0, 4), // Y축 방향으로 약간 아래로 이동하여 inner shadow 효과 생성
              ),
            ],
          ),
          child: SizedBox.expand(
            child: FractionallySizedBox(
              heightFactor: 0.8, // 부모 컨테이너 높이의 80%
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // 배경색을 흰색으로 설정
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ), // 위쪽 부분만 border radius를 적용
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "뇌동맥류 검사 방식 선택",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InputPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.pressed)) {
                              // 클릭 시 배경 색
                              return Color(0xFF6C63FE); // 클릭 시 색상
                            } else {
                              // 클릭되지 않았을 때의 배경 색
                              return Color(0xFFD9D9D9); // 클릭되지 않은 상태의 색상
                            }
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                          ),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.hovered)) {
                              // hover 시 오버레이 색 (일반적으로 투명도를 줄여서 사용)
                              return Colors.transparent.withOpacity(0.1);
                            } else {
                              return Colors
                                  .transparent; // hover되지 않았을 때의 오버레이 색
                            }
                          }),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/choiceIcon1.png',
                                  width: 60, // 이미지의 너비 설정
                                  height: 60, // 이미지의 높이 설정
                                ),
                              ],
                            ),
                            SizedBox(width: 10), // 이미지와 텍스트 사이의 간격 조절
                            Text(
                              '직접 입력',
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
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.pressed)) {
                              // 클릭 시 배경 색
                              return Color(0xFF6C63FE); // 클릭 시 색상
                            } else {
                              // 클릭되지 않았을 때의 배경 색
                              return Color(0xFFD9D9D9); // 클릭되지 않은 상태의 색상
                            }
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                          ),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.hovered)) {
                              // hover 시 오버레이 색 (일반적으로 투명도를 줄여서 사용)
                              return Colors.transparent.withOpacity(0.1);
                            } else {
                              return Colors
                                  .transparent; // hover되지 않았을 때의 오버레이 색
                            }
                          }),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/choiceIcon2.png',
                                  width: 50, // 이미지의 너비 설정
                                  height: 50, // 이미지의 높이 설정
                                ),
                              ],
                            ),
                            SizedBox(width: 10), // 이미지와 텍스트 사이의 간격 조절
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
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.pressed)) {
                              // 클릭 시 배경 색
                              return Color(0xFF6C63FE); // 클릭 시 색상
                            } else {
                              // 클릭되지 않았을 때의 배경 색
                              return Color(0xFFD9D9D9); // 클릭되지 않은 상태의 색상
                            }
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                          ),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.hovered)) {
                              // hover 시 오버레이 색 (일반적으로 투명도를 줄여서 사용)
                              return Colors.transparent.withOpacity(0.1);
                            } else {
                              return Colors
                                  .transparent; // hover되지 않았을 때의 오버레이 색
                            }
                          }),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/choiceIcon3.png',
                                  width: 40, // 이미지의 너비 설정
                                  height: 40, // 이미지의 높이 설정
                                ),
                              ],
                            ),
                            SizedBox(width: 10), // 이미지와 텍스트 사이의 간격 조절
                            Text(
                              '건강 정보\n 불러오기',
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
            ),
          ),
        ),
      ),
    );
  }
}
