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

  Color? buttonColor = Colors.grey[300];

  // 수면시간과 운동시간의 선택지에 "-" 추가
  final List<String> sleepTimeOptions = ['-', '7시간 이하', '7-8시간', '8시간 이상'];
  final List<String> exerciseTimeOptions = ['-', '1시간 미만', '1-3시간', '3시간 이상'];

  // 초기값 설정
  String selectedSleepTime = '-';
  String selectedExerciseTime = '-';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 20), // 이 부분을 TextFormField 위에만 추가
                    DropdownButtonFormField<String>(
                      value: selectedSleepTime, // 초기값 설정
                      items: sleepTimeOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSleepTime = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: '하루 평균 수면시간에 해당하는 항목을 골라주세요',
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedExerciseTime, // 초기값 설정
                      items: exerciseTimeOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedExerciseTime = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: '일주일 운동시간에 해당하는 항목을 골라주세요',
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChoicePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          primary: buttonColor ?? Colors.grey[300],
                        ),
                        onHover: (isHovering) {
                          setState(() {
                            buttonColor = isHovering ? Color(0xFF6C63FE) : Colors.grey[300];
                          });
                        },
                        child: Text(
                          '다음 단계로',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
