
import 'package:brain/ChatBotPage.dart';
import 'package:brain/ChoicePage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
          markerId: MarkerId(_markerIdCounter.toString()), // Unique identifier for the marker
          position: LatLng(latitude, longitude), // Position of the marker
          // infoWindow: InfoWindow(
          //   title: hospitalName, // Title for the InfoWindow
          //   //snippet: "병원", // You can customize the snippet as needed
          // ),
          icon: BitmapDescriptor.defaultMarker, // Icon for the marker
        ),
      );
      _markerIdCounter++;
    });
  }

  void addMarkersFromCoordinatesAndNames() {
    _addMarker(37.32226705, 127.0959527);
    _addMarker(37.27077538, 127.1481873);
    _addMarker(37.2675855, 127.0792803);
    _addMarker(37.27367477, 127.1114343);
    _addMarker(37.2745915, 127.072624);
    _addMarker(37.32984985, 127.1093531);
    _addMarker(37.2331599, 127.2108993);
    _addMarker(37.2967488, 127.1088556);
    _addMarker(37.24031755, 127.2144905);
    _addMarker(37.21935921, 127.2135029);
    _addMarker(37.23154215, 127.2113984);
    _addMarker(37.138525, 127.4134609);
    _addMarker(37.30065634, 127.0661905);
    _addMarker(37.31681485, 127.0847982);
    _addMarker(37.27428289, 127.1391788);
    _addMarker(37.26573275, 127.1505813);
    _addMarker(37.2736269, 127.2278566);
    _addMarker(37.2932897, 127.1214353);
    _addMarker(37.23539578, 127.2010802);
    _addMarker(37.3315314, 127.1127594);
    // Add other coordinates and hospital names similarly
  }

// Call addMarkersFromCoordinatesAndNames() to add markers with coordinates and hospital names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 제목을 가운데 정렬합니다.
          children: [
            IconButton(
              icon: Image.asset('MainLogo.png'), // 로고 이미지
              onPressed: () {
                // 로고를 클릭했을 때 실행될 동작
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('UserIcon.png'), // 사용자 아이콘 이미지
            onPressed: () {
              // 사용자 아이콘을 클릭했을 때 실행될 동작을 여기에 작성합니다.
            },
          ),
        ],
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
        type: BottomNavigationBarType.fixed, // 아이템들이 동일한 공간을 차지하도록 설정
        selectedItemColor: Colors.black, // 선택된 아이템의 색상을 검정으로 설정
        unselectedItemColor: Colors.black, // 선택되지 않은 아이템의 색상을 검정으로 설정
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
            icon: ImageIcon(AssetImage('CommunityIcon.png'), color: Colors.black),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('ChatBotIcon.png'), color: Colors.black),
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

