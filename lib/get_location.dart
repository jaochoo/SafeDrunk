import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'SubmitLocationPage.dart';
import 'log.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  State<SelectLocation> createState() => SelectionLocation_state();
}

class SelectionLocation_state extends State<SelectLocation> {
  int i = 0;
  String locationMessage = 'Current location of user';
  late String lat;
  late String long;
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select destination')),
        body: Form(
            key: _formKey,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Location"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter location';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      _getCurrentLocation().then((value) {
                                        lat = '${value.latitude}';
                                        long = '${value.longitude}';
                                        print("_getCurrentLocation is Run");
                                        setState(() {
                                          locationMessage =
                                              'Latitude: $lat , Longitude: $long';
                                          print(locationMessage);
                                          usernameController.value =
                                              usernameController.value.copyWith(
                                            text: locationMessage,
                                            selection: TextSelection.collapsed(
                                                offset: locationMessage.length),
                                          );
                                        });
                                        _liveLocation();
                                      });
                                    },
                                    child: Text('Get Current Location'))
                              ])),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        logList.add(Log(usernameController.text,
                                            DateTime.now().toString()));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SubmitLocationPage(
                                                      location:
                                                          usernameController
                                                              .text,
                                                    )));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Please fill input')),
                                        );
                                      }
                                    },
                                    child: Text('Submit Location'))
                              ]))
                    ]))));
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude: $lat , Longitude: $long';
      });
    });
  }
}

Future<Position> _getCurrentLocation() async {
  bool serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnable) {
    return Future.error('Location service disable');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permission are denied we can not request location permission');
  }

  return await Geolocator.getCurrentPosition();
}
