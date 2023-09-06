import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapboxMapPage(),
    );
  }
}

class MapboxMapPage extends StatefulWidget {
  @override
  _MapboxMapPageState createState() => _MapboxMapPageState();
}

class _MapboxMapPageState extends State<MapboxMapPage> {
  late MapboxMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox Map Example'),
      ),
      body: MapboxMap(
        accessToken:
            'sk.eyJ1Ijoia2VlcnRoaXByYXNhZGh0IiwiYSI6ImNsbTdjZGYweDB2MjIzZW1tNTgzM3hxdjgifQ.WAK34Ly4ZwDk9m0cPEPzQQ',
        styleString:
            'mapbox://styles/mapbox/streets-v11', // Replace with your desired map style
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map center coordinates
          zoom: 12.0, // Initial zoom level
        ),
      ),
    );
  }

  void onMapCreated(MapboxMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  void dispose() {
    if (mapController != null) {
      mapController.dispose();
    }
    super.dispose();
  }
}
