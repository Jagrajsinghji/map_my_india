import 'package:example/screens/auto_suggest.dart';
import 'package:example/screens/still_map.dart';
import 'package:flutter/material.dart';
import 'package:map_my_india/map_my_india.dart';

import 'screens/geocode.dart';
import 'util/configuration.dart';

late final MapMyIndia mapMyIndia;

void main() {
  mapMyIndia = MapMyIndia();
  mapMyIndia.configure(mmmiConfig());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
            body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const StillMapAPIScreen()));
                  },
                  child: const Text("Still Map API")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const AutoSuggestAPIScreen()));
                  },
                  child: const Text("Auto Suggest API")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const GeocodeAPIScreen()));
                  },
                  child: const Text("Geocode API")),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ));
      }),
    );
  }
}
