import 'package:brain/ChatBotPage.dart';
import 'package:brain/ChoicePage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.272149, 127.108282); // 센터 위도 경도

  // Define a Set to hold the markers
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // Add marker when map is created
    addMarkersFromCoordinatesAndNames();
  }

  int _markerIdCounter = 1;

  // Function to add marker
  void _addMarker(double latitude, double longitude) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_markerIdCounter.toString()),
          // Unique identifier for the marker
          position: LatLng(latitude, longitude),
          // Position of the marker
          // infoWindow: InfoWindow(
          //   title: hospitalName, // Title for the InfoWindow
          //   //snippet: "병원", // You can customize the snippet as needed
          // ),
          // icon: BitmapDescriptor.defaultMarker, // Icon for the marker
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue), //블루로 색상 바꾸는거 근데 안되서 assess로 따와야함
        ),
      );
      _markerIdCounter++;
    });
  }

  void addMarkersFromCoordinatesAndNames() {
    _addMarker(37.271, 127.0959527);
    _addMarker(37.27402, 127.1115);
    _addMarker(37.27714, 127.1525);
    _addMarker(37.27545, 127.0735);
    _addMarker(37.27433, 127.139);
    _addMarker(37.29349, 127.121415);

    // Add other coordinates and hospital names similarly
  }

// Call addMarkersFromCoordinatesAndNames() to add markers with coordinates and hospital names

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
          child: Image.asset('assets/HeaderLogo.png'), // 이미지 경로 수정
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        markers: _markers,
      ),
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Color(0xFF1C2541),
        type: BottomNavigationBarType.fixed,
        // 아이템들이 동일한 공간을 차지하도록 설정
        selectedItemColor: Colors.white,
        // 선택된 아이템의 색상을 검정으로 설정
        unselectedItemColor: Colors.white,
        // 선택되지 않은 아이템의 색상을 검정으로 설정
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/mapIcon.png'),
                color: Colors.white),
            // 이미지 경로 수정
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/TestIcon.png'),
                color: Colors.white),
            // 이미지 경로 수정
            label: '뇌동맥 판단',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/CommunityIcon.png'),
                color: Colors.white),
            // 이미지 경로 수정
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/ChatBotIcon.png'),
                color: Colors.white),
            // 이미지 경로 수정
            label: '챗봇',
          ),
        ],
        onTap: (index) {
          // 탭에 따른 페이지 이동 로직
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
              // 커뮤니티 페이지로 이동해야 하는 경우 여기에 해당 페이지로 이동하는 코드를 추가합니다.
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
