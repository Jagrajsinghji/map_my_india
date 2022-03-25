class GeocodeQueryParams {
  ///'It takes in the country code. Possible values are listed in a table (here)[https://github.com/MapmyIndia/mapmyindia-rest-api/blob/master/docs/countryISO.md]. Default is India (IND).'
  final String? region;

  ///address to be geocoded
  final String address;

  ///parameter can be set to get maximum number of result items from the API (default: 1).
  final int? itemCount;

  ///This parameter can be used to set Urban or Rural bias. A positive value sets the Urban bias and a negative value sets Rural bias. This optional parameter & its related effect on response is not applicable for regions apart from India (IND). Allowed values are:
  ///
  /// 0 : Default: (No bias)
  /// -1 : Rural
  /// 1 : Urban
  final int? bias;

  ///This parameter can be used to set admin level restriction. The result will be either the given admin level or equivalent admin or higher in the hierarchy. No lower admin will be considered for geocoding.This optional parameter & its related effect on response is not applicable for regions apart from India (IND).
  /// Allowed values are:
  /// hno : house number
  /// hna : house name
  /// poi : point of interest
  /// street : street
  /// sslc : sub sub locality
  /// village : village
  /// slc : sub locality
  /// sdist : sub district
  /// loc : locality
  /// city : city
  /// dist : district
  /// pincode :pincode
  /// state : state
  final String? podFilter;

  /// This parameter can be used to set admin boundary, which means geocoding will be done within the given admin. The allowed admin bounds are Sub-District, District, City, State and Pincode. The parameter accepts the admin eLoc as value. This optional parameter & its related effect on response is not applicable for regions apart from India (IND).
  ///
  /// Note: Please note that podFilter & bound parameters are mutually exclusive. They cannot be used together in an API call.

  final String? bound;

  GeocodeQueryParams(
      {required this.address,
      this.region,
      this.itemCount,
      this.bias,
      this.podFilter,
      this.bound});

  String toQueryString() {
    String params = "?address=$address";
    if (region != null) {
      params += "&region=$region";
    }
    if (itemCount != null) {
      params += "&itemCount=$itemCount";
    }
    if (bias != null) {
      params += "&bias=$bias";
    }
    if (podFilter != null) {
      params += "&podFilter=$podFilter";
    }
    if (bound != null) {
      params += "&bound=$bound";
    }
    return params;
  }
}
