import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jenosize/presentation/maps/maps.dart';
import 'package:jenosize/presentation/restuarant/restuarant.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../configs/colors.dart';
import 'sections/header_card_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String lat;
  late String long;
  String locationMessage = 'ที่อยู่ปัจจุบัน คือ';
  final ScrollController _scrollController = ScrollController();
  bool showTitle = false;

  Future<void> _openMap(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'Could not lunch $googleUrl';
  }

  static const CameraPosition _jenoSizeLocate = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(13.89425737830917, 100.51636186782461),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition _goToJenosize() {
    // final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(
    //   CameraUpdate.newCameraPosition(_jenoSizeLocate),
    // );
    return const CameraPosition(
      target: LatLng(13.89425737830917, 100.51636186782461),
    );
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

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > HeaderCardContent.height - kToolbarHeight;

    // Prevent unneccesary rebuild
    if (this.showTitle == showTitle) return;

    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  bool isDoublePress = false;
  Future<bool> _onWillPop() {
    if (isDoublePress) {
      return Future.value(true);
    } else {
      Get.snackbar('แจ้งเตือน!', 'กดอีกครั้งเพื่อทำการออก');
      isDoublePress = true;
      Timer(const Duration(seconds: 3), () => isDoublePress = false);
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              expandedHeight: HeaderCardContent.height,
              floating: true,
              pinned: true,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              backgroundColor: AppColors.red,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Visibility(
                  visible: showTitle,
                  child: const Text(
                    'Jenosize',
                    // style: Theme.of(context)
                    //     .appBarTheme
                    //     .toolbarTextStyle!
                    //     .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                background: const HeaderCardContent(),
              ),
            ),
          ],
          body: Container(),
        ),

        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const RestuarantPage(),
        //       ),
        //     );
        //   },
        //   child: const Text('ค้นหาร้านอาหาร'),
        // ),
        // const SizedBox(height: 20),
        // Text(locationMessage, textAlign: TextAlign.center),
        // const SizedBox(height: 20),
        // ElevatedButton(
        //   onPressed: () {
        //     _getCurrentLocation().then((value) {
        //       lat = '${value.latitude}';
        //       long = '${value.longitude}';
        //       setState(() {
        //         locationMessage = 'latitude: $lat , Longitude: $long';
        //       });
        //       _liveLocation();
        //     });
        //   },
        //   child: const Text('ที่อยู่ปัจจุบันของฉัน'),
        // ),
        // const SizedBox(height: 20),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const JenosizeMaps(),
        //       ),
        //     );
        //     // _openMap(lat, long);
        //   },
        //   child: const Text('แผนที่ บริษัท Jenosize'),
        // ),
      ),
    );
  }
}
