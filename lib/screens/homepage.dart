// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.lat, this.long}) : super(key: key);

  double? lat, long;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: widget.lat != null
          ? Text("LAT: ${widget.lat}, LNG: ${widget.long}")
          : const Text('Current Location Is Not Selected'),
    );
  }
}
