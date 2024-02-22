import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final LatLng pinLocation = const LatLng(41.999980, 21.394391);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 197, 126, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Map',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: pinLocation,
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(41.999980, 21.394391),
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.indigo[800],
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {
                launchGoogleMaps(pinLocation.latitude, pinLocation.longitude);
              },
              child: const Text('Navigate to Pin'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchGoogleMaps(double latitude, double longitude) async {
    final urlString =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude'; // String URL
    final uri = Uri.parse(urlString); // Convert string to Uri object

    if (await canLaunchUrl(uri)) {
      // Use Uri object with canLaunch
      await launchUrl(uri); // Use Uri object with launch
    } else {
      throw 'Could not launch ${uri.toString()}'; // Use Uri object in error message
    }
  }
}
