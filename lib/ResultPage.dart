
import 'package:flutter/material.dart';
import 'package:brain/MapPage.dart';

import 'ChatBotPage.dart';
import 'ChoicePage.dart';

class ResultPage extends StatefulWidget {
  final String? systolicBloodPressure;
  final String? fastingBloodSugar;

  const ResultPage({
    Key? key,
    required this.systolicBloodPressure,
    required this.fastingBloodSugar,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('MainLogo.png'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('UserIcon.png'),
            onPressed: () {
              // Add functionality for user icon tap
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultSection(title: '뇌동맥 위험도 측정 결과'),
            SizedBox(height: 20),
            ResultSection(title: '뇌동맥 관련 수치', systolicBloodPressure: widget.systolicBloodPressure, fastingBloodSugar: widget.fastingBloodSugar),
            SizedBox(height: 20),
            ResultSection(title: '위험도에 따른 솔루션 안내'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('mapIcon.png'), color: Colors.black),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('TestIcon.png'), color: Colors.black),
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('CommunityIcon.png'), color: Colors.black),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('ChatBotIcon.png'), color: Colors.black),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChoicePage()),
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

class ResultSection extends StatefulWidget {
  final String title;
  final String? systolicBloodPressure;
  final String? fastingBloodSugar;

  const ResultSection({Key? key, required this.title, this.systolicBloodPressure, this.fastingBloodSugar}) : super(key: key);

  @override
  _ResultSectionState createState() => _ResultSectionState();
}

class _ResultSectionState extends State<ResultSection> {
  bool showDescription = false;
  late IconData bloodSugarIcon;
  late Color bloodSugarIconColor;
  late IconData bloodPressureIcon;
  late Color bloodPressureIconColor;
  late IconData overallIcon;
  late String overallMessage;

  @override
  void initState() {
    super.initState();
    _setBloodSugarIcon();
    _setBloodPressureIcon();
    _setOverallStatus();
    overallMessage='';
    overallIcon=Icons.warning;
  }

  void _setBloodSugarIcon() {
    final fastingBloodSugar = double.tryParse(widget.fastingBloodSugar ?? '');
    if (fastingBloodSugar != null) {
      if (fastingBloodSugar <= 99) {
        bloodSugarIcon = Icons.check_circle;
        bloodSugarIconColor = Colors.green;
      } else if (fastingBloodSugar >= 100 && fastingBloodSugar <= 125) {
        bloodSugarIcon = Icons.error;
        bloodSugarIconColor = Colors.yellow;
      } else {
        bloodSugarIcon = Icons.warning;
        bloodSugarIconColor = Colors.red;
      }
    } else {
      // Handle if blood sugar value is not available or invalid
      bloodSugarIcon = Icons.warning;
      bloodSugarIconColor = Colors.grey;
    }
  }

  void _setBloodPressureIcon() {
    final systolicBloodPressure = double.tryParse(widget.systolicBloodPressure ?? '');
    if (systolicBloodPressure != null) {
      if (systolicBloodPressure < 120) {
        bloodPressureIcon = Icons.check_circle;
        bloodPressureIconColor = Colors.green;
      } else if (systolicBloodPressure >= 120 && systolicBloodPressure < 140) {
        bloodPressureIcon = Icons.error;
        bloodPressureIconColor = Colors.yellow;
      } else {
        bloodPressureIcon = Icons.warning;
        bloodPressureIconColor = Colors.red;
      }
    } else {
      // Handle if blood pressure value is not available or invalid
      bloodPressureIcon = Icons.warning;
      bloodPressureIconColor = Colors.grey;
    }
  }


  void _setOverallStatus() {
    final fastingBloodSugar = widget.fastingBloodSugar;
    final systolicBloodPressure = widget.systolicBloodPressure;

    if (fastingBloodSugar != null && systolicBloodPressure != null) {
      final fastingBloodSugarValue = double.tryParse(fastingBloodSugar);
      final systolicBloodPressureValue = double.tryParse(systolicBloodPressure);
      print(fastingBloodSugar);
      print(systolicBloodPressure);

      if (fastingBloodSugarValue != null && systolicBloodPressureValue != null) {
        print(fastingBloodSugar);
        print(systolicBloodPressure);
        if (fastingBloodSugarValue >= 126 &&
            systolicBloodPressureValue >= 140) {
          setState(() {
            overallIcon = Icons.warning;
            overallMessage = '뇌동맥 파열 위험이 매우 높습니다.';
          });
          print("매우 위험");
        } else if ((fastingBloodSugarValue >= 100 && fastingBloodSugarValue <= 125) ||
            (systolicBloodPressureValue >= 120 &&
                systolicBloodPressureValue < 140)) {
          setState(() {
            overallIcon = Icons.error;
            overallMessage = '뇌동맥 파열 위험이 높습니다.';
          });
        } else if (fastingBloodSugarValue > 99 || systolicBloodPressureValue >= 120) {
          setState(() {
            overallIcon = Icons.error;
            overallMessage = '뇌동맥 파열 위험이 있습니다.';
          });
        } else {
          setState(() {
            overallIcon = Icons.check_circle;
            overallMessage = '뇌동맥 파열 위험이 없습니다.';
          });
        }
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(showDescription ? Icons.remove : Icons.add),
                  onPressed: () {
                    setState(() {
                      showDescription = !showDescription;
                    });
                  },
                ),
              ],
            ),
            if (showDescription) // Showing description based on showDescription state
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getDescriptionWidgets(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getDescriptionWidgets() {
    switch (widget.title) {
      case '뇌동맥 위험도 측정 결과':
        print(overallMessage);
        return [
          _buildDescriptionWithIcon(
            context,
            overallMessage ?? '뇌동맥 파열 위험을 평가할 수 없습니다.', // 기본값 설정
            overallIcon ?? Icons.warning, // 기본값 설정
          ),
        ];
      case '위험도에 따른 솔루션 안내':
        return [
          const Text(
            '의심일 경우: 증상이 의심스러운 경우, 즉시 의료진의 상담을 받아야 합니다. 의료진은 증상을 평가하고 적절한 검사를 통해 뇌동맥류의 가능성을 확인할 수 있습니다.',
            style: TextStyle(fontSize: 16.0),
          ),
        ];
      case '뇌동맥 관련 수치':
        return [
          Row(
            children: [
              Icon(bloodPressureIcon, color: bloodPressureIconColor),
              SizedBox(width: 8.0),
              Text(
                '혈압 : ${widget.systolicBloodPressure ?? 'N/A'}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            children: [
              Icon(bloodSugarIcon, color: bloodSugarIconColor),
              SizedBox(width: 8.0),
              Text(
                '혈당 : ${widget.fastingBloodSugar ?? 'N/A'}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ];
      default:
        return [];
    }
  }

  Widget _buildDescriptionWithIcon(
      BuildContext context, String description, IconData iconData) {
    return Row(
      children: [
        Icon(iconData, color: iconData == Icons.warning ? Colors.red : iconData == Icons.error ? Colors.yellow : Colors.green),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
