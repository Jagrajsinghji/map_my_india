import 'dart:async';

import 'package:flutter/material.dart';
import 'package:map_my_india/map_my_india.dart';

import '../main.dart';

class AutoSuggestAPIScreen extends StatefulWidget {
  const AutoSuggestAPIScreen({Key? key}) : super(key: key);

  @override
  State<AutoSuggestAPIScreen> createState() => _AutoSuggestAPIScreenState();
}

class _AutoSuggestAPIScreenState extends State<AutoSuggestAPIScreen> {
  TextEditingController textEditingController = TextEditingController();
  Timer? timer;
  List<SuggestedLocations> suggestedLocations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: textEditingController,
          cursorColor: Colors.white,
          onChanged: (term) {
            if (term.trim().isEmpty) suggestedLocations.clear();
            setState(() {});
            getLocations(term.trim());
          },
          decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () {
                  textEditingController.clear();
                  suggestedLocations.clear();
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
      ),
      body: suggestedLocations.isEmpty
          ? const Center(
              child: Text("Search Location"),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: suggestedLocations.length,
              itemBuilder: (c, index) {
                SuggestedLocations loc = suggestedLocations.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${loc.placeName}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${loc.placeAddress}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }),
    );
  }

  void getLocations(String location) {
    timer?.cancel();
    timer = Timer(
      const Duration(milliseconds: 800),
      () async {
        try {
          var res = await mapMyIndia.getAutoSuggestions(
              suggestionQueryParams: SuggestionQueryParams(location));
          suggestedLocations = res.suggestedLocations;
          setState(() {});
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
