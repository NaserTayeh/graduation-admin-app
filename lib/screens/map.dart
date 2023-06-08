import 'dart:developer';

import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as MapLauncher;
import 'package:provider/provider.dart';

class MapHome extends StatefulWidget {
  const MapHome({super.key});

  @override
  State<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  Set<Marker> markers = {};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _determinePosition();
  }

  void addNewMarker(LatLng latLng) {
    markers.clear();
    Marker marker = Marker(markerId: MarkerId('1'), position: latLng);
    markers.add(marker);
    setState(() {});
  }

  animateMapToLocation(LatLng latLng) {
    mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 11));
  }

  getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    animateMapToLocation(LatLng(position.latitude, position.longitude));
  }

  void _lanuchMapsUrl(LatLng coords) async {
    await MapLauncher.MapLauncher.launchMap(
        mapType: MapLauncher.MapType.google,
        coords: MapLauncher.Coords(coords.latitude, coords.longitude),
        title: 'title');
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();

    animateMapToLocation(LatLng(position.latitude, position.longitude));
    return await Geolocator.getCurrentPosition();
  }

  // showAlertDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Confirmation'),
  //         content: Text('Are you sure you want to save this Location?'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text('Confirm'),
  //             onPressed: () {
  //               // Perform the action
  //               Navigator.of(context).pop();
  //               // Add your action logic here
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  showAlertDialog(BuildContext context, String long, String latit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF44FF95),
                  Color(0xFF21760D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Confirmation',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Are you sure you want to save this Location?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      onPressed: () async {
                        // Perform the action
                        AuthProvider authProvider =
                            Provider.of(context, listen: false);
                        await authProvider.updateLocation(long, latit);
                        Navigator.of(context).pop();
                        // Add your action logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning,
                  size: 50.0,
                  color: Colors.orange,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Can not save!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'You must detect a location.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                log('-' * 10);
                log(markers.first.position.longitude.toString());

                if (markers.length > 0) {
                  log('heeeeeeeeeeeeeeeeeeeeeeeeeee');
                  showAlertDialog(
                      context,
                      markers.first.position.longitude.toString(),
                      markers.first.position.latitude.toString());
                  ;
                } else {
                  showWarningDialog(context);
                }
              },
              icon: const Icon(Icons.gps_fixed),
              label: const Text('Save Location')),
        ),
        appBar: AppBar(
          title: const Text('Gym Location'),
          elevation: 2,
        ),
        body: GoogleMap(
          markers: markers,
          onTap: (argument) {
            log(argument.toString());
            addNewMarker(argument);
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
