import 'package:flutter/material.dart';
import 'package:brain/ResultPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'MyHomePage.dart'; // json.encode를 사용하기 위해 import합니다.

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController baseYearController = TextEditingController();
  final TextEditingController subscriberIdController = TextEditingController();
  final TextEditingController cityCodeController = TextEditingController();
  final TextEditingController genderCodeController = TextEditingController();
  final TextEditingController ageGroupCodeController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController waistCircumferenceController = TextEditingController();
  final TextEditingController leftEyeSightController = TextEditingController();
  final TextEditingController rightEyeSightController = TextEditingController();
  final TextEditingController leftHearingController = TextEditingController();
  final TextEditingController rightHearingController = TextEditingController();
  final TextEditingController systolicBloodPressureController = TextEditingController();
  final TextEditingController diastolicBloodPressureController = TextEditingController();
  final TextEditingController fastingBloodSugarController = TextEditingController();
  final TextEditingController totalCholesterolController = TextEditingController();
  final TextEditingController triglyceridesController = TextEditingController();
  final TextEditingController hdlCholesterolController = TextEditingController();
  final TextEditingController ldlCholesterolController = TextEditingController();
  final TextEditingController hemoglobinController = TextEditingController();
  final TextEditingController urineProteinController = TextEditingController();
  final TextEditingController serumCreatinineController = TextEditingController();
  final TextEditingController astController = TextEditingController();
  final TextEditingController altController = TextEditingController();
  final TextEditingController gammaGtpController = TextEditingController();
  final TextEditingController smokingStatusController = TextEditingController();
  final TextEditingController drinkingStatusController = TextEditingController();
  final TextEditingController oralExamController = TextEditingController();
  final TextEditingController dentalCariesController = TextEditingController();
  final TextEditingController missingTeethController = TextEditingController();
  final TextEditingController dentalAbnormalitiesController = TextEditingController();
  final TextEditingController thirdMolarAbnormalitiesController = TextEditingController();
  final TextEditingController tartarController = TextEditingController();

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: baseYearController,
              decoration: const InputDecoration(labelText: '기준 년도'),
            ),
            TextFormField(
              controller: subscriberIdController,
              decoration: const InputDecoration(labelText: '가입자 일련번호'),
            ),
            TextFormField(
              controller: cityCodeController,
              decoration: const InputDecoration(labelText: '시도 코드'),
            ),
            TextFormField(
              controller: genderCodeController,
              decoration: const InputDecoration(labelText: '성별 코드'),
            ),
            TextFormField(
              controller: ageGroupCodeController,
              decoration: const InputDecoration(labelText: '연령대 코드'),
            ),
            TextFormField(
              controller: heightController,
              decoration: const InputDecoration(labelText: '신장'),
            ),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(labelText: '체중'),
            ),
            TextFormField(
              controller: waistCircumferenceController,
              decoration: const InputDecoration(labelText: '허리 둘레'),
            ),
            TextFormField(
              controller: leftEyeSightController,
              decoration: const InputDecoration(labelText: '시력(좌)'),
            ),
            TextFormField(
              controller: rightEyeSightController,
              decoration: const InputDecoration(labelText: '시력(우)'),
            ),
            TextFormField(
              controller: leftHearingController,
              decoration: const InputDecoration(labelText: '청력(좌)'),
            ),
            TextFormField(
              controller: rightHearingController,
              decoration: const InputDecoration(labelText: '청력(우)'),
            ),
            TextFormField(
              controller: systolicBloodPressureController,
              decoration: const InputDecoration(labelText: '수축기 혈압'),
            ),
            TextFormField(
              controller: diastolicBloodPressureController,
              decoration: const InputDecoration(labelText: '이완기 혈압'),
            ),
            TextFormField(
              controller: fastingBloodSugarController,
              decoration: const InputDecoration(labelText: '식전 혈당'),
            ),
            TextFormField(
              controller: totalCholesterolController,
              decoration: const InputDecoration(labelText: '총 콜레스테롤'),
            ),
            TextFormField(
              controller: triglyceridesController,
              decoration: const InputDecoration(labelText: '트리글리세라이드'),
            ),
            TextFormField(
              controller: hdlCholesterolController,
              decoration: const InputDecoration(labelText: 'HDL 콜레스테롤'),
            ),
            TextFormField(
              controller: ldlCholesterolController,
              decoration: const InputDecoration(labelText: 'LDL 콜레스테롤'),
            ),
            TextFormField(
              controller: hemoglobinController,
              decoration: const InputDecoration(labelText: '혈색소'),
            ),
            TextFormField(
              controller: urineProteinController,
              decoration: const InputDecoration(labelText: '요단백'),
            ),
            TextFormField(
              controller: serumCreatinineController,
              decoration: const InputDecoration(labelText: '혈청 크레아티닌'),
            ),
            TextFormField(
              controller: astController,
              decoration: const InputDecoration(labelText: '간기능검사 AST'),
            ),
            TextFormField(
              controller: altController,
              decoration: const InputDecoration(labelText: '간기능검사 ALT'),
            ),
            TextFormField(
              controller: gammaGtpController,
              decoration: const InputDecoration(labelText: '감마지티피'),
            ),
            TextFormField(
              controller: smokingStatusController,
              decoration: const InputDecoration(labelText: '흡연상태'),
            ),
            TextFormField(
              controller: drinkingStatusController,
              decoration: const InputDecoration(labelText: '음주여부'),
            ),
            TextFormField(
              controller: oralExamController,
              decoration: const InputDecoration(labelText: '구강검진 수검 여부'),
            ),
            TextFormField(
              controller: dentalCariesController,
              decoration: const InputDecoration(labelText: '치아 우식증 유무'),
            ),
            TextFormField(
              controller: missingTeethController,
              decoration: const InputDecoration(labelText: '결손치 유무'),
            ),
            TextFormField(
              controller: dentalAbnormalitiesController,
              decoration: const InputDecoration(labelText: '치아 마모증 유무'),
            ),
            TextFormField(
              controller: thirdMolarAbnormalitiesController,
              decoration: const InputDecoration(labelText: '제3대구치 이상'),
            ),
            TextFormField(
              controller: tartarController,
              decoration: const InputDecoration(labelText: '치석'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // 각 폼 필드의 값들을 Map 형태로 저장합니다.
                Map<String, dynamic> inputData = {
                  '기준년도': baseYearController.text,
                  '가입자_일련번호': subscriberIdController.text,
                  '시도코드': cityCodeController.text,
                  '성별코드': genderCodeController.text,
                  '연령대코드': ageGroupCodeController.text,
                  '신장': heightController.text,
                  '체중': weightController.text,
                  '허리둘레': waistCircumferenceController.text,
                  '시력_좌': leftEyeSightController.text,
                  '시력_우': rightEyeSightController.text,
                  '청력_좌': leftHearingController.text,
                  '청력_우': rightHearingController.text,
                  '수축기_혈압': systolicBloodPressureController.text,
                  '이완기_혈압': diastolicBloodPressureController.text,
                  '식전혈당': fastingBloodSugarController.text,
                  '총_콜레스테롤': totalCholesterolController.text,
                  '트리글리세라이드': triglyceridesController.text,
                  '콜레스테롤_HDL': hdlCholesterolController.text,
                  '콜레스테롤_LDL': ldlCholesterolController.text,
                  '혈색소': hemoglobinController.text,
                  '요단백': urineProteinController.text,
                  '혈청크레아티닌': serumCreatinineController.text,
                  '간기능검사_AST': astController.text,
                  '간기능검사_ALT': altController.text,
                  '감마지티피': gammaGtpController.text,
                  '흡연상태': smokingStatusController.text,
                  '음주여부': drinkingStatusController.text,
                  '구강검진수검여부': oralExamController.text,
                  '치아우식증유무': dentalCariesController.text,
                  '결손치유무': missingTeethController.text,
                  '치아마모증유무': dentalAbnormalitiesController.text,
                  '제3대구치_이상': thirdMolarAbnormalitiesController.text,
                  '치석': tartarController.text,
                };

                // 서버로 데이터를 전송합니다.
                bool success = await sendDataToServer(inputData);

                if (success) {
                  // 데이터가 성공적으로 전송된 경우 결과 페이지로 이동합니다.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResultPage(fastingBloodSugar: '', systolicBloodPressure: '',)),
                  );
                } else {
                  // 데이터 전송에 실패한 경우 알림을 표시합니다.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('데이터 전송에 실패했습니다.')),
                  );
                }
              },
              child:
              const Text('결과보기'),
            ),
          ],
        ),
      ),
    );
  }
}
Future<bool> sendDataToServer(Map<String, dynamic> healthRecord) async {
  final url = Uri.parse('http://localhost:8080/save-data');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'}, // JSON 형식으로 데이터를 전송하기 위한 헤더를 추가합니다.
      body: json.encode(healthRecord), // Map을 JSON 문자열로 변환하여 전송합니다.
    );

    if (response.statusCode == 200) {
      print('데이터가 성공적으로 전송되었습니다.');
      return true; // 데이터 전송 성공 시 true 반환
    } else {
      print('데이터 전송에 실패했습니다.');
      return false; // 데이터 전송 실패 시 false 반환
    }
  } catch (e) {
    print('오류: $e');
    return false; // 예외 발생 시 false 반환
  }
}