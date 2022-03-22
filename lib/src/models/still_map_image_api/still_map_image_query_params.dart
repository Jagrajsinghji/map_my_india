class StillMapImageQueryParams {
  ///A WGS-84 position coordinate that specifies the centre of the image requested.
  final String center;

  ///The REST API licence key allocated to you by signing into our services and registering yourself as a developer.
  final String restKey;

  ///The zoom level for which the image is requested. Ranges from 4 to 18 with 18 being the highest zoomed in level.
  final int zoom;

  ///The size of the image requested in pixels as widthxheight.
  final String size;

  ///scale factor indicating retina or non-retina tiles.
  ///
  /// 0 = non retina tiles
  /// 1 = retina tiles
  /// Available values : 0, 1
  ///
  /// Default value : 0
  final int ssf;

  ///Optional markers that you may want to add to the map tile.
  /// Specified by WGS-84 position coordinates, seperated by semi-colon.
  /// eg: "28.5959394,77.2255611; 22,79; ..."
  final String? markers;

  ///The URL of the Custom Marker.
  final String? markerIcons;

  StillMapImageQueryParams(this.center, this.restKey,
      {this.zoom = 15,
      this.size = "400x400",
      this.ssf = 0,
      this.markers,
      this.markerIcons});

  String toQueryString() {
    String params = "?center=$center&zoom=$zoom&size=$size&ssf=$ssf";
    if (markers != null) {
      params += "&markers=$markers";
    }
    if (markerIcons != null) {
      params += "&markers_icon=$markerIcons";
    }
    return params;
  }
}
