import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('지도 페이지'),
      ),
      body: const Center(
        child: Text('여기에 지도 표시'),
      ),
    );
  }
}
