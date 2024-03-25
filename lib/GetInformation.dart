import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// var uri = Uri.https('api.odcloud.kr', '/api/15007122/v1/uddi:0c59c663-3222-4e70-80eb-fb993b5bacf7', {
//   'page': '$page',
//   'perPage': '$perPage',
//   'returnType': returnType,
//   'serviceKey': apiKey, // 여기에서 apiKey는 URL 인코딩을 고려하지 않고 직접 입력
// });

//건강검진정보 받아오기 위젯
class GetInformation extends StatefulWidget {
  const GetInformation({Key? key}) : super(key: key);

  @override
  _GetInformationState createState() => _GetInformationState();
}

class _GetInformationState extends State<GetInformation> {
  final HealthCheckService _healthCheckService = HealthCheckService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('건강검진 정보 받아오는 페이지'),
      ),
      body: FutureBuilder<dynamic>(
        future: _healthCheckService.fetchHealthData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          var data = snapshot.data['data'] as List<dynamic>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              return ListTile(
                title: Text(item['성별코드'].toString()),
                // 여기에 더 많은 정보를 표시할 수 있습니다.
              );
            },
          );
        },
      ),
    );
  }
}

class HealthCheckService {
  Future<dynamic> fetchHealthData(
      {int page = 1, int perPage = 10, String returnType = 'JSON'}) async {
    // Decoding된 일반 인증키 사용
    String apiKey =
        'JgAb28Ve/vBqEp+TZ+HMzLl48HjWpJG/Ol3n1kPoHmRhvY4maXS4a93UJCLeQu/AhTLCFUchhX1+hNz5ctHdvg==';
    // Uri.https를 사용하여 요청 URL 구성
    var uri = Uri.https('api.odcloud.kr',
        '/api/15007122/v1/uddi:0c59c663-3222-4e70-80eb-fb993b5bacf7', {
      'page': page.toString(),
      'perPage': perPage.toString(),
      'returnType': returnType,
      'serviceKey': apiKey,
    });

    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      // 추가적인 헤더가 필요할 경우 여기에 입력
    });

    if (response.statusCode == 200) {
      // 성공적으로 데이터를 받아옴
      return json.decode(response.body);
    } else {
      // 데이터 로드 실패
      throw Exception('Failed to load health check data');
    }
  }
}
