import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MyApp.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await NaverMapSdk.instance.initialize(clientId: '13yo3nwhkp',onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
  runApp(const MyApp());
}



// Future<void> _initialize() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NaverMapSdk.instance.initialize(
//       clientId: '13yo3nwhkp',     // 클라이언트 ID 설정
//       onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed")
//   );
// }
