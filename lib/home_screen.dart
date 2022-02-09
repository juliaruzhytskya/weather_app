import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String long = "long";

  String lat = "lat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
          ElevatedButton(
              onPressed: () async {
                Position position = await LocationService.getCurrentLocation();
                setState(() {
                  long = position.longitude.toString();
                  lat = position.latitude.toString();
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              child: const Icon(Icons.my_location, color: Colors.black))
        ]),
        body: Center(child: Text("$long $lat")));
  }
}
