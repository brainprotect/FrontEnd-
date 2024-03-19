import 'package:flutter/material.dart';
import 'package:brain/ResultPage.dart';

// 직접 입력 페이지
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _systolicBloodPressureController = TextEditingController();
  TextEditingController _fastingBloodSugarController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('직접 입력 페이지'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(decoration: const InputDecoration(labelText: '기준년도')),
            TextFormField(decoration: const InputDecoration(labelText: '가입자 일련번호')),
            TextFormField(decoration: const InputDecoration(labelText: '시도코드')),
            TextFormField(decoration: const InputDecoration(labelText: '성별코드')),
            TextFormField(decoration: const InputDecoration(labelText: '연령대코드(5세 단위)')),
            TextFormField(decoration: const InputDecoration(labelText: '신장(5cm 단위)')),
            TextFormField(decoration: const InputDecoration(labelText: '체중(5kg 단위)')),
            TextFormField(decoration: const InputDecoration(labelText: '허리둘레')),
            TextFormField(decoration: const InputDecoration(labelText: '시력(좌)')),
            TextFormField(decoration: const InputDecoration(labelText: '시력(우)')),
            TextFormField(decoration: const InputDecoration(labelText: '청력(좌)')),
            TextFormField(decoration: const InputDecoration(labelText: '청력(우)')),
            TextFormField(
              controller: _systolicBloodPressureController,
              decoration: const InputDecoration(labelText: '수축기 혈압'),
            ),
            TextFormField(decoration: const InputDecoration(labelText: '이완기 혈압')),
            TextFormField(
              controller: _fastingBloodSugarController,
              decoration: const InputDecoration(labelText: '식전 혈당'),
            ),
            TextFormField(decoration: const InputDecoration(labelText: '총 콜레스테롤')),
            TextFormField(decoration: const InputDecoration(labelText: '트리글리세라이드')),
            TextFormField(decoration: const InputDecoration(labelText: '콜레스테롤(HDL)')),
            TextFormField(decoration: const InputDecoration(labelText: '콜레스테롤(LDL)')),
            TextFormField(decoration: const InputDecoration(labelText: '혈색소')),
            TextFormField(decoration: const InputDecoration(labelText: '요단백')),
            TextFormField(decoration: const InputDecoration(labelText: '혈청크레아티닌')),
            TextFormField(decoration: const InputDecoration(labelText: '간기능검사(AST)')),
            TextFormField(decoration: const InputDecoration(labelText: '간기능검사(ALT)')),
            TextFormField(decoration: const InputDecoration(labelText: '감마지티피')),
            TextFormField(decoration: const InputDecoration(labelText: '흡연상태')),
            TextFormField(decoration: const InputDecoration(labelText: '음주여부')),
            TextFormField(decoration: const InputDecoration(labelText: '구강검진수검여부')),
            TextFormField(decoration: const InputDecoration(labelText: '치아우식증유무')),
            TextFormField(decoration: const InputDecoration(labelText: '결손치유무')),
            TextFormField(decoration: const InputDecoration(labelText: '치아마모증유무')),
            TextFormField(decoration: const InputDecoration(labelText: '제3대구치(사랑니)이상')),
            TextFormField(decoration: const InputDecoration(labelText: '치석')),
            // 필요에 따라 추가 필드를 계속 추가할 수 있습니다.
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      systolicBloodPressure: _systolicBloodPressureController.text,
                      fastingBloodSugar: _fastingBloodSugarController.text,
                    ),
                  ),
                );
              },
              child: const Text('결과보기'),
            ),
          ],
        ),
      ),
    );
  }
}