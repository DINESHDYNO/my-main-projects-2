import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String googleApiKey = "AIzaSyBu2JNP2Cp4_vOZwZ37ewueMtoKttO_27s";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? mapController;
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  LatLng? _latLng;
  final LatLng startPoint = LatLng(13.054728, 80.249658);
  final LatLng midPoint = LatLng(13.03585637162815, 80.24625760629236);
  final LatLng endPoint = LatLng(13.007626518094414, 80.25496510948972);

  Set<Marker> markers = {};
  Set<Polyline> polylines = {}; // Updated to use Polyline

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() {
    getPolyPoints();
    getCurrentLocation();
   // getcurrentLocation();
  }

  void getPolyPoints() async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();

      // Clear existing polylineCoordinates list before adding new points
      polylineCoordinates.clear();

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(startPoint.latitude, startPoint.longitude),
        PointLatLng(endPoint.latitude, endPoint.longitude),
      );

      if (result.status == 'OK' && result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });

        // Update the polylines set
        polylines.add(Polyline(
          polylineId: PolylineId('polyline'),
          color: Colors.purpleAccent,
          width: 5,
          points: List.from(polylineCoordinates), // Use a copy of the list
        ));

        setState(() {});
      } else {
        print('Error getting route: ${result.errorMessage}');
      }
    } catch (e) {
      print('Error getting route: $e');
    }
  }

  void getCurrentLocation() async {
    Location location = Location();
    try {
      LocationData userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        // Update the markers set and camera position based on user's current location
        markers.add(
          Marker(
            markerId: const MarkerId('userLocation'),
            position: LatLng(userLocation.latitude!, userLocation.longitude!),
            infoWindow: const InfoWindow(
              title: 'Your Location',
            ),
          ),
        );
      });
    } catch (e) {
      print('Error getting location: $e');
    }
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      setState(() {});
    });
  }
  Future<void> getcurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    _latLng = LatLng(_locationData.latitude!, _locationData.longitude!);

    CameraPosition newCameraPosition = CameraPosition(
      target: _latLng!,
      zoom: 14.4746,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }
  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Polyline with Markers'),
      ),
      body: currentLocation == null
          ? const Center(
              child: Text('loading...'),
            )
          : GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: startPoint,
          zoom: 13.5,
        ),
        markers: markers,
        polylines: polylines, // Use the updated polylines set
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: getcurrentLocation,
        child: const Icon(Icons.my_location, color: Colors.blue),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {

    setState(() async {
      mapController = controller;
      markers.add(
        Marker(
          markerId: const MarkerId('start'),
          position: startPoint,
          infoWindow: const InfoWindow(
            title: 'Start Point',
          ),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId('end'),
          position: endPoint,
          draggable: true,
          infoWindow: const InfoWindow(
            title: 'End Point',
          ),
        ),
      );
    });
  }

}

