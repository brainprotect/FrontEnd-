import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Uint8List> _userImages = [];
  final ScrollController _scrollController = ScrollController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _userImages.add(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Camera Page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _userImages.isEmpty
                  ? Center(child: Text("No image selected."))
                  : Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _userImages.map((bytes) => ClipRRect(
                  borderRadius: BorderRadius.circular(8), // 이미지에 둥근 모서리를 추가
                  child: Image.memory(bytes, width: 550, height: 550, fit: BoxFit.cover), // 크기 조정 및 BoxFit.cover 적용
                )).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.camera),
                    label: Text("카메라"),
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    icon: Icon(Icons.photo_library),
                    label: Text("갤러리"),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}