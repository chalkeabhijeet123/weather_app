// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/widgets/c_button.dart';

class LadingScreen extends StatefulWidget {
  const LadingScreen({Key? key}) : super(key: key);

  @override
  State<LadingScreen> createState() => _LadingScreenState();
}

class _LadingScreenState extends State<LadingScreen> {
  // Position? _currentPosition;

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // setState(() {
      //   _currentPosition = position;
      // });
      print('current position: ${position.latitude}, ${position.longitude}');
      // print(_currentPosition);
      if (position != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    lat: position.latitude,
                    long: position.longitude,
                  )),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
              title: 'Get Location',
              color: const Color.fromARGB(255, 170, 197, 243),
              onTap: () => getLocation(),
            ),
          ],
        ),
      ),
    );
  }
}
