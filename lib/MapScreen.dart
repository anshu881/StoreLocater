import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_loacter_app/store_model.dart';


class MapScreen extends StatelessWidget {
  final Store store;

  MapScreen({required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map View")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(store.latitude, store.longitude),
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId(store.name),
            position: LatLng(store.latitude, store.longitude),
          ),
        },
      ),
    );
  }
}
