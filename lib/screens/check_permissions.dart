import 'package:flutter/material.dart';
import 'package:location/location.dart';

class CkeckPermissions extends StatefulWidget {
  const CkeckPermissions({Key? key}) : super(key: key);

  @override
  State<CkeckPermissions> createState() => _CkeckPermissionsState();
}

class _CkeckPermissionsState extends State<CkeckPermissions> {
  final Location location = Location();
  PermissionStatus? _permissionGranted;

  Future<void> _checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'App Permission',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Permission status: ${_permissionGranted ?? "unknown"}',
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(
            color: Colors.redAccent,
            thickness: 1.0,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 42),
                child: TextButton(
                  child: const Text('Check'),
                  onPressed: _checkPermissions,
                ),
              ),
              TextButton(
                child: const Text('Request'),
                onPressed: _permissionGranted == PermissionStatus.granted
                    ? null
                    : _requestPermission,
              )
            ],
          )
        ],
      ),
    );
  }
}
