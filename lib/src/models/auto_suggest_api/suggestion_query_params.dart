enum Pod {
  /// Sublocality
  slc,

  ///Locality
  lc,

  ///City
  city,

  ///Village
  vlg,

  ///Subdistrict
  sdist,

  ///District
  dist,

  ///State
  state,

  ///Subsublocality
  sslc,
}

class SuggestionQueryParams {
  ///the query on which the search has to be done.
  final String query;

  ///Location is required to get location biased autosuggest results.
  final String? location;

  ///It takes in the country code. Possible values are listed in a table [here](https://github.com/MapmyIndia/mapmyindia-rest-api/blob/master/docs/countryISO.md). Default is India (IND).
  final String? region;

  ///It is the valueless parameter provides the different address attributes in a structured object.
  final bool? tokenizeAddress;

  ///It takes in the place type code which helps in restricting the results to certain chosen type. This optional parameter & its related effect on response is not applicable for regions apart from India (IND).
  ///
  /// See [Pod] and [podToString] for available codes
  late final String? pod;

  ///This parameter helps you restrict the result either by mentioning a bounded area or to certain eloc (6 digit code to any poi, locality, city, etc.).
  ///This optional parameter & its related effect on response is not applicable for regions apart from India (IND).
  ///
  ///Below mentioned are the available types:
  ///
  ///filter = pin:It takes pincode/postal code of an area{e.g. filter=pin:110055}
  ///
  ///filter = bounds lat1,lng1;lat2,lng2(latitude,longitude){e.g. filter=bounds 28.598882, 77.212407; 28.467375, 77.353513}
  ///
  ///filter = cop {eloc} (string) {e.g. filter=cop:YMCZ0J}
  final String? filter;

  ///(Valueless)It initiates a bridge to be created to provide applicable nearby API searches in the suggestedSearches response object.
  ///This optional parameter & its related effect on response is not applicable for regions apart from India (IND).
  final bool? bridge;

  ///valueless): This parameter lets the search give results that are hyper-localized to the reference location passed in the location parameter.
  ///This means that nearby results are given higher ranking than results far from the reference location. Highly prominent results will still appear in the search results, however they will be lower in the list of results.
  ///This parameter will work ONLY in conjunction with the [location] parameter.
  ///This optional parameter & its related effect on response is not applicable for regions apart from India (IND).
  final bool? hyperLocal;

  SuggestionQueryParams(this.query,
      {this.location,
      this.region,
      this.tokenizeAddress,
      Pod? pod,
      this.filter,
      this.bridge,
      this.hyperLocal}) {
    this.pod = podToString(pod);
  }

  String? podToString(Pod? pod) {
    String? podString;
    switch (pod) {
      case Pod.slc:
        podString = "SLC";
        break;
      case Pod.lc:
        podString = "LC";
        break;
      case Pod.city:
        podString = "CITY";
        break;
      case Pod.vlg:
        podString = "VLG";
        break;
      case Pod.sdist:
        podString = "SDIST";
        break;
      case Pod.dist:
        podString = "DIST";
        break;
      case Pod.state:
        podString = "STATE";
        break;
      case Pod.sslc:
        podString = "SSLC";
        break;
      default:
    }
    return podString;
  }

  String toQueryString() {
    String params = "?query=$query";
    if (location != null) {
      params += "&location=$location";
    }
    if (region != null) {
      params += "&region=$region";
    }
    if (tokenizeAddress != null) {
      params += "&tokenizeAddress=$tokenizeAddress";
    }
    if (pod != null) {
      params += "&pod=$pod";
    }
    if (filter != null) {
      params += "&filter=$filter";
    }
    if (bridge != null) {
      params += "&bridge=$bridge";
    }
    if (hyperLocal != null) {
      params += "&location=$hyperLocal";
    }
    return params;
  }
}
