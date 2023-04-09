// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jenosize/presentation/widgets/main_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class JenosizeMaps extends StatefulWidget {
  const JenosizeMaps({Key? key}) : super(key: key);

  @override
  State<JenosizeMaps> createState() => JenosizeMapsState();
}

class JenosizeMapsState extends State<JenosizeMaps> {
  late String lat;
  late String long;
  String locationMessage = 'Current location is';
  // var _jenosize = Get.arguments;

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
      setState(() {
        locationMessage = 'latitude: $lat , Longitude: $long';
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'Could not lunch $googleUrl';
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location service are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanenly denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _jenoSizeLocate = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(13.89425737830917, 100.51636186782461),
      tilt: 59.440717697143555,
      zoom: 17.8);

  static const Marker _kJenosizeMarker = Marker(
    markerId: MarkerId('_kJenosizeMarker'),
    infoWindow: InfoWindow(title: 'Jenosize'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(13.89425737830917, 100.51636186782461),
  );

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {
          _kJenosizeMarker,
        },
        mapType: MapType.normal,
        initialCameraPosition: _jenoSizeLocate,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToJenosize,
        label: const Text('เส้นทางไป Jenosize'),
        icon: const Icon(Icons.turn_sharp_right_outlined),
      ),
    );
  }

  Future<void> _goToJenosize() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_jenoSizeLocate),
    );
  }
}
