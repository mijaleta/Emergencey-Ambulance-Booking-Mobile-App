import 'package:ambu_app/helpers/gps.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DemoMap extends StatefulWidget {
  const DemoMap({super.key});

  @override
  State<DemoMap> createState() => _DemoMapState();
}

class _DemoMapState extends State<DemoMap> {
  final GPS _gps = GPS();
  Position? _userPosition;
  Exception? _exception;

  void _handlePositionStream(Position position){
    setState(() {
      _userPosition = position;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _gps.stopPositionStream();
  }


  @override
  void initState() {
    super.initState();
    _gps.startPositionStream(_handlePositionStream).catchError((e){
      setState(() {
        _exception = e;
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    Widget child;

    if(_exception!= null){
      child = const Text('Please provide GPS permission');
    }
    else if(_userPosition == null){
      child = CircularProgressIndicator();
    }
    else{
      child = Text(_userPosition.toString());
    }
    return Scaffold(
      body: Center(child: child),
    );
  }
}
