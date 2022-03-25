class GeocodeResponse {
  GeocodeResponse({
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
    required this.formattedAddress,
    required this.eLoc,
    required this.latitude,
    required this.longitude,
    required this.geocodeLevel,
    required this.confidenceScore,
  });

  ///House Number of the POI.
  late final String? houseNumber;

  ///House Name of the POI.
  late final String? houseName;

  ///Name of the POI.
  late final String? poi;

  ///Name of the street.
  late final String? street;

  ///Name of the subsublocality.
  late final String? subSubLocality;

  ///Name of the sublocality.
  late final String? subLocality;

  ///Name of the locality.
  late final String? locality;

  ///Name of the village.
  late final String? village;

  ///Name of the subDistrict.
  late final String? subDistrict;

  ///Name of the District.
  late final String? district;

  ///Name of the city.
  late final String? city;

  ///Name of the State.
  late final String? state;

  ///Pincode of the location.
  late final String? pincode;

  ///This shows the formatted address of the POI.
  late final String? formattedAddress;

  ///It is the Six or eight digit unique code offered only by mapmyindia to search for any address through this eLoc.
  late final String? eLoc;

  ///It shows us the latitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? latitude;

  ///It shows us the longitude of the location searched.
  ///Geometry information is NOT available in most use-case driven response; and is RESTRICTED.
  late final String? longitude;

  ///This shows the level of the geocode means on which basis the poi has been geocoded.
  late final String? geocodeLevel;

  ///The confidence for current of geocodelevel.
  late final double? confidenceScore;

  GeocodeResponse.fromJson(Map<String, dynamic> json) {
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
    formattedAddress = json['formattedAddress'];
    eLoc = json['eLoc'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    geocodeLevel = json['geocodeLevel'];
    confidenceScore = json['confidenceScore'];
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
    _data['formattedAddress'] = formattedAddress;
    _data['eLoc'] = eLoc;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['geocodeLevel'] = geocodeLevel;
    _data['confidenceScore'] = confidenceScore;
    return _data;
  }
}
