import 'package:flutter/material.dart';
import 'package:gebetamap/gebetamap.dart';

class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  
  @override
  Widget build(BuildContext context) {
    return GebetaMap();
  }
}
