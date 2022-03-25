import 'dart:async';

import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:map_my_india/map_my_india.dart';

class GeocodeAPIScreen extends StatefulWidget {
  const GeocodeAPIScreen({Key? key}) : super(key: key);

  @override
  State<GeocodeAPIScreen> createState() => _GeocodeAPIScreenState();
}

class _GeocodeAPIScreenState extends State<GeocodeAPIScreen> {
  TextEditingController textEditingController = TextEditingController();
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: TextFormField(
        controller: textEditingController,
        cursorColor: Colors.white,
        onChanged: (term) {
          setState(() {});
          geocodeLocation(term.trim());
        },
        decoration: InputDecoration(
            suffix: IconButton(
              onPressed: () {
                textEditingController.clear();
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.clear),
            ),
            hintText: "Search Location",
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white)),
        style:
        const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
    ),);
  }

  void geocodeLocation(String location) async{
    timer?.cancel();
    timer = Timer(
      const Duration(milliseconds: 800),
          () async {
        try {
          var res = await mapMyIndia.geocodeAddress(GeocodeQueryParams(address: location));
          print(res);
          setState(() {});
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
