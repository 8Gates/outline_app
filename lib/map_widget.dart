import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapScreen({super.key, required this.latitude, required this.longitude});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location on Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 15.0,
        ),
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('Location'),
            position: LatLng(widget.latitude, widget.longitude),
            infoWindow: const InfoWindow(title: 'Your Location'),
          ),
        },
      ),
    );
  }
}
