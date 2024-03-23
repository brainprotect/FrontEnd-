import 'package:flutter/material.dart';
import 'package:brain/ChoicePage.dart';

import 'InputPage.dart';

class BrainAssessmentPopup extends StatefulWidget {
  @override
  _BrainAssessmentPopupState createState() => _BrainAssessmentPopupState();
}
class _BrainAssessmentPopupState extends State<BrainAssessmentPopup> {
  bool? familyHealthCondition = false;
  bool showAdditionalQuestions = false;
  TextEditingController _additionalInfoController = TextEditingController();

  // 수정된 변수
  Color? buttonColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent, // AlertDialog의 배경을 투명하게 설정
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content:               Container(
        decoration: BoxDecoration(
          color: Colors.white, // 폼의 배경을 흰색으로 설정
          borderRadius: BorderRadius.circular(10), // 둥근 사각형 모양으로 설정
        ),
        padding: EdgeInsets.all(20), // 폼의 여백을 추가
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20), // 폼 간의 간격을 추가
              Row(
                children: [
                  Text(
                    '가족 중에 고혈압이나 당뇨등 가족력이 있습니까?',
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: familyHealthCondition,
                        onChanged: (value) {
                          setState(() {
                            familyHealthCondition = value;
                            showAdditionalQuestions = value!;
                          });
                        },
                      ),
                      Text('예'),
                      Radio<bool>(
                        value: false,
                        groupValue: familyHealthCondition,
                        onChanged: (value) {
                          setState(() {
                            familyHealthCondition = value;
                            showAdditionalQuestions = false;
                          });
                        },
                      ),
                      Text('아니오'),
                    ],
                  ),
                ],
              ),
              if (showAdditionalQuestions)
                TextFormField(
                  controller: _additionalInfoController,
                  decoration: InputDecoration(
                    labelText: '고혈압, 당뇨 암등 가족력이 있는 병을 적어주세요.',
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                items: <String>[
                  '7시간 이하',
                  '7-8시간',
                  '8시간 이상',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // 선택된 값을 처리하는 로직 추가
                },
                decoration: InputDecoration(
                  labelText: '하루 평균 수면시간에 해당하는 항목을 골라주세요',
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // 둥근 사각형 모양으로 설정
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                items: <String>[
                  '1시간 미만',
                  '1-3시간',
                  '3시간 이상',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // 선택된 값을 처리하는 로직 추가
                },
                decoration: InputDecoration(
                  labelText: '일주일 운동시간에 해당하는 항목을 골라주세요',
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // 둥근 사각형 모양으로 설정
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
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
              primary: buttonColor ?? Colors.grey[300], // 변수가 널이 아닌 경우 색상 사용, 그렇지 않으면 회색 사용
            ),
            onHover: (isHovering) {
              setState(() {
                buttonColor = isHovering ? Colors.blue : Colors.grey[300]; // 마우스 호버에 따라 색상 변경
              });
            },
            child: Text(
              '다음 단계로',
              style: TextStyle(color: Colors.white), // 흰색 글자색
            ),
          ),
        ),
      ],
    );
  }
}