// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/services/api_service.dart';

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
        body: FutureBuilder(
            future: ApiService().getWeatherDetails(
                widget.lat!.toDouble(), widget.long!.toDouble()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              // print('snapshot data:---' + data['weather'][0]['id'].toString());
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(data.toString()),
                  ),
                );
              }
            }));
  }
}
