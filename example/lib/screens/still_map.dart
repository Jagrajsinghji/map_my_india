import 'package:flutter/material.dart';
import 'package:map_my_india/map_my_india.dart';

import '../main.dart';

class StillMapAPIScreen extends StatelessWidget {
  const StillMapAPIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Still Map API")),
      body: Center(
          child: Image.network(mapMyIndia.getStillMapImageUrl(
              stillMapImageQueryParams:
                  StillMapImageQueryParams("17,79", zoom: 9)))),
    );
  }
}
