import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map")),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(10.0263, 76.3073), // Ernakulam
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(10.0263, 76.3073), // Ernakulam
                width: 80.0,
                height: 80.0,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
              Marker(
                point: LatLng(10.1960, 76.3860), // Angamaly
                width: 80.0,
                height: 80.0,
                child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}