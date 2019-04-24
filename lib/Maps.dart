import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Maps Page: 
// Includes Logic for Map implementation and layout, and currently contains a button
// that adds markers to the map. Moving forward, The Sign Up Bar will interact with the AddMarker
// Method and refere to a list of ID/ LatLng values 

class MapPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(39.745862, -104.993065);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  
  // As of now, adds marker to the centermost point of the screen when panning through map.
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            
            // Map Logic
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 18.0,
              ),
              mapType: MapType.normal,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            
            // Button Logic
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue[300],
                      child: const Icon(Icons.add_location, size: 30.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}