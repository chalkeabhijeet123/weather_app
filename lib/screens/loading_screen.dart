// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/widgets/c_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LadingScreen extends StatefulWidget {
  const LadingScreen({Key? key}) : super(key: key);

  @override
  State<LadingScreen> createState() => _LadingScreenState();
}

class _LadingScreenState extends State<LadingScreen> {
  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      print('current position: ${position.latitude}, ${position.longitude}');
      if (position != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              lat: position.latitude,
              long: position.longitude,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      // Do something
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: SvgPicture.asset(
                'assets/cloudy-day-2.svg',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CommonButton(
              title: 'let\'s Start',
              color: const Color.fromARGB(255, 170, 197, 243),
              onTap: () => getLocation(),
            ),
          ],
        ),
      ),
    );
  }
}
