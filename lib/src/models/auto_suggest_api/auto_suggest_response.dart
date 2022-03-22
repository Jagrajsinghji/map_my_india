///The result object which contains the Autosuggest API results.
class AutoSuggestResponse {
  AutoSuggestResponse({
    required this.suggestedLocations,
    required this.userAddedLocation,
    required this.suggestedSearches,
    required this.lang,
  });

  late final List<SuggestedLocations> suggestedLocations;

  ///The result object which contains the user added POI results.
  late final List<UserAddedLocation> userAddedLocation;

  /// The result object which contains the Auto Suggest API Suggested results shows.
  late final List<SuggestedSearches> suggestedSearches;

  ///example: hi
  ///
  ///Used to indicate if the response is in some language other than the default(which is en).
  ///Valid values are hi, which indicates Hindi response.
  late final String? lang;

  AutoSuggestResponse.fromJson(Map<String, dynamic> json) {
    suggestedLocations = List.from(json['suggestedLocations'] ?? [])
        .map((e) => SuggestedLocations.fromJson(e))
        .toList();
    userAddedLocation = List.from(json['userAddedLocation'] ?? [])
        .map((e) => UserAddedLocation.fromJson(e))
        .toList();
    suggestedSearches = List.from(json['suggestedSearches'] ?? [])
        .map((e) => SuggestedSearches.fromJson(e))
        .toList();
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['suggestedLocations'] =
        suggestedLocations.map((e) => e.toJson()).toList();
    _data['userAddedLocation'] =
        userAddedLocation.map((e) => e.toJson()).toList();
    _data['suggestedSearches'] =
        suggestedSearches.map((e) => e.toJson()).toList();
    _data['lang'] = lang;
    return _data;
  }
}

class SuggestedLocations {
  SuggestedLocations({
    required this.type,
    required this.typeX,
    required this.placeAddress,
    required this.latitude,
    required this.longitude,
    required this.eLoc,
    required this.entryLatitude,
    required this.entryLongitude,
    required this.placeName,
    required this.alternateName,
    required this.keywords,
    required this.addressTokens,
    required this.p,
    required this.orderIndex,
    required this.score,
    required this.suggester,
    required this.richInfo,
  });

  ///example: POI
  ///
  /// This is the type whether the results is POI or any building point.
  late final String? type;

  ///example: 7
  ///
  /// Type attribute for internal use only for MapmyIndia.
  late final int? typeX;

  ///example: Yippee Rooms, Sector 56, Gurugram, Haryana, 122011
  ///
  /// Address of the location.
  late final String? placeAddress;

  ///example: RESTRICTED
  ///
  /// It shows us the latitude of the location searched.
  /// Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? latitude;

  ///example: RESTRICTED
  ///
  ///It shows us the longitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? longitude;

  /// example: 2LH9OC
  ///
  /// It is the Six or eight digit unique code offered only by mapmyindia to search for any address through this eLoc.
  late final String? eLoc;

  ///example: RESTRICTED
  ///
  ///It shows us the latitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? entryLatitude;

  ///example: RESTRICTED
  ///
  ///It shows us the longitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? entryLongitude;

  ///example: OYO Hotel
  ///
  /// This shows the name of the POI
  late final String? placeName;

  /// example: OyoRooms,OYO 40400 Yippe Rooms,OYO Rooms Hotel
  ///
  /// This shows the alternate name of the POI
  late final String? alternateName;

  /// The keywords/category codes associated with the given result.
  late final List<String> keywords;

  ///It shows the admin details along with the house address.
  ///Address token information is NOT available in generic response; and is RESTRICTED.
  late final AddressTokens? addressTokens;

  ///example: 11663
  ///
  /// This shows the priority of the POI
  late final int? p;

  ///example: 1
  ///
  /// This shows the order of the search results priority wise.
  late final int? orderIndex;

  ///example: 1.5075794782130676
  ///
  /// This shows the score of the POI.
  late final double? score;

  ///example: alternateName
  ///
  /// This shows on which basis the search results has been found.
  late final String? suggester;

  /// This shows the rich info associated with the given result.
  late final List<String> richInfo;

  SuggestedLocations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    typeX = json['typeX'];
    placeAddress = json['placeAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    eLoc = json['eLoc'];
    entryLatitude = json['entryLatitude'];
    entryLongitude = json['entryLongitude'];
    placeName = json['placeName'];
    alternateName = json['alternateName'];
    keywords = List.castFrom<dynamic, String>(json['keywords'] ?? []);
    addressTokens = json['addressTokens'] != null
        ? AddressTokens.fromJson(json['addressTokens'])
        : null;
    p = json['p'];
    orderIndex = json['orderIndex'];
    score = json['score'];
    suggester = json['suggester'];
    richInfo = List.castFrom<dynamic, String>(json['richInfo'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['typeX'] = typeX;
    _data['placeAddress'] = placeAddress;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['eLoc'] = eLoc;
    _data['entryLatitude'] = entryLatitude;
    _data['entryLongitude'] = entryLongitude;
    _data['placeName'] = placeName;
    _data['alternateName'] = alternateName;
    _data['keywords'] = keywords;
    _data['addressTokens'] = addressTokens?.toJson();
    _data['p'] = p;
    _data['orderIndex'] = orderIndex;
    _data['score'] = score;
    _data['suggester'] = suggester;
    _data['richInfo'] = richInfo;
    return _data;
  }
}

class AddressTokens {
  AddressTokens({
    required this.houseNumber,
    required this.houseName,
    required this.poi,
    required this.street,
    required this.subSubLocality,
    required this.subLocality,
    required this.locality,
    required this.village,
    required this.subDistrict,
    required this.district,
    required this.city,
    required this.state,
    required this.pincode,
  });

  ///example: 237
  ///
  /// House Number of the POI.
  late final String? houseNumber;

  ///example: MMI Building
  ///
  ///House Name of the POI
  late final String? houseName;

  ///example: MapmyIndia Head Office
  ///
  /// Name of the POI.
  late final String? poi;

  /// Name of the street.
  late final String? street;

  ///Name of the subsublocality.
  late final String? subSubLocality;

  ///example: Okhla industrial phase 3
  ///
  /// Name of the locality.
  late final String? subLocality;

  ///example: Okhla industrial phase 3
  ///
  /// Name of the locality.
  late final String? locality;

  ///example: Okhla Vilage
  ///
  /// Name of the village.
  late final String? village;

  ///Name of the subDistrict.
  late final String? subDistrict;

  ///example: South Delhi
  ///
  /// Name of the District.
  late final String? district;

  ///example: New Delhi
  ///
  /// Name of the city.
  late final String? city;

  ///example: Delhi
  ///
  /// Name of the STATE.
  late final String? state;

  ///example: 110010
  ///
  /// PINcode of the location.
  late final String? pincode;

  AddressTokens.fromJson(Map<String, dynamic> json) {
    houseNumber = json['houseNumber'];
    houseName = json['houseName'];
    poi = json['poi'];
    street = json['street'];
    subSubLocality = json['subSubLocality'];
    subLocality = json['subLocality'];
    locality = json['locality'];
    village = json['village'];
    subDistrict = json['subDistrict'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['houseNumber'] = houseNumber;
    _data['houseName'] = houseName;
    _data['poi'] = poi;
    _data['street'] = street;
    _data['subSubLocality'] = subSubLocality;
    _data['subLocality'] = subLocality;
    _data['locality'] = locality;
    _data['village'] = village;
    _data['subDistrict'] = subDistrict;
    _data['district'] = district;
    _data['city'] = city;
    _data['state'] = state;
    _data['pincode'] = pincode;
    return _data;
  }
}

class UserAddedLocation {
  UserAddedLocation({
    required this.eLoc,
    required this.entryLatitude,
    required this.entryLongitude,
    required this.latitude,
    required this.longitude,
    required this.orderIndex,
    required this.placeAddress,
    required this.placeName,
    required this.resultType,
    required this.type,
    required this.userName,
  });

  ///example: 2LH9OC
  ///
  /// It is the Six or eight digit unique code offered only by mapmyindia to search for any address through this eLoc.
  late final String? eLoc;

  ///example: RESTRICTED
  ///
  ///latitude of the entrance of the location.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? entryLatitude;

  ///example: RESTRICTED
  ///
  ///longitude of the entrance of the location.
  /// Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? entryLongitude;

  ///example: RESTRICTED
  ///
  ///It shows us the longitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? latitude;

  ///example: RESTRICTED
  ///
  ///It shows us the longitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? longitude;

  ///example: 1
  ///
  /// This shows the order of the search results priority wise.
  late final int? orderIndex;

  ///example: Yippee Rooms, Sector 56, Gurugram, Haryana, 122011
  ///
  /// This is the address of the text searched by you.
  late final String? placeAddress;

  ///example: OYO Hotel
  ///
  /// This shows the name of the POI.
  late final String? placeName;

  /// example: UAP
  ///
  /// It Shows the the category of result falling into. For eg. UAP
  late final String? resultType;
  late final String? type;

  ///example: usr1577100139i799918080
  ///
  /// It shows the UserID of the person who added the location.
  late final String? userName;

  UserAddedLocation.fromJson(Map<String, dynamic> json) {
    eLoc = json['eLoc'];
    entryLatitude = json['entryLatitude'];
    entryLongitude = json['entryLongitude'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    orderIndex = json['orderIndex'];
    placeAddress = json['placeAddress'];
    placeName = json['placeName'];
    resultType = json['resultType'];
    type = json['type'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['eLoc'] = eLoc;
    _data['entryLatitude'] = entryLatitude;
    _data['entryLongitude'] = entryLongitude;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['orderIndex'] = orderIndex;
    _data['placeAddress'] = placeAddress;
    _data['placeName'] = placeName;
    _data['resultType'] = resultType;
    _data['type'] = type;
    _data['userName'] = userName;
    return _data;
  }
}

class SuggestedSearches {
  SuggestedSearches({
    required this.keyword,
    required this.identifier,
    required this.location,
    required this.hyperlink,
    required this.orderIndex,
    required this.eLoc,
  });

  ///example: corona testing lab
  ///
  ///It shows the result keyword
  late final String? keyword;

  ///example: near
  ///
  /// on what basis the results shown
  late final String? identifier;

  ///example: me
  ///
  /// location near the results are shown
  late final String? location;

  ///example: https://atlas.mapmyindia.com/api/places/nearby/json?explain&richData&username=atlasuser&refLocation=28.550592,77.26877&keywords=hsptst
  ///
  /// direct link of the poi.
  late final String? hyperlink;

  ///example: 0
  ///
  ///This shows the order of the search results priority wise.
  late final int? orderIndex;

  /// It is the Six or eight digit unique code offered only by mapmyindia to search for any address through this eLoc.
  late final String? eLoc;

  SuggestedSearches.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    identifier = json['identifier'];
    location = json['location'];
    hyperlink = json['hyperlink'];
    orderIndex = json['orderIndex'];
    eLoc = json['eLoc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['keyword'] = keyword;
    _data['identifier'] = identifier;
    _data['location'] = location;
    _data['hyperlink'] = hyperlink;
    _data['orderIndex'] = orderIndex;
    _data['eLoc'] = eLoc;
    return _data;
  }
}
