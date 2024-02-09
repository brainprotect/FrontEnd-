import 'package:flutter/material.dart';

// 건강검진정보 받아오기
class GetInformation extends StatefulWidget {
  const GetInformation({Key? key}) : super(key: key);

  @override
  _GetInformationState createState() => _GetInformationState();
}

class _GetInformationState extends State<GetInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('건강검진 정보 받아오는 페이지'),
      ),
      body: const Center(
        child: Text('여기에 건강 검진 정보를 표시합니다.'),
      ),
    );
  }
}