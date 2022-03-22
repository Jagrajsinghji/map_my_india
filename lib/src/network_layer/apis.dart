import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:map_my_india/src/network_layer/base_urls.dart';

import '../models/auto_suggest_api/suggestion_query_params.dart';
import '../models/still_map_image_api/still_map_image_query_params.dart';
import '../models/token_generation_api/auth_info.dart';
import '../models/token_generation_api/token_generation_body.dart';

class APIs {
  ///This API is required to generate tokens authorize the oAuth 2 based APIs.
  /// Hence, the developer would need to send a request for access token using their client_id and client_secret to the Token Generation API.
  /// Once validated from the OAuth API, the access_token and the token_type need to be sent as Authorization header with the value: {token_type} {access_token}
  /// for more visit [https://www.mapmyindia.com/api/advanced-maps/doc/authentication-api.php#](https://www.mapmyindia.com/api/advanced-maps/doc/authentication-api.php#)
  Future<http.Response> generateAuthInfo(TokenGenerationBody body) async {
    return http.post(Uri.parse(BaseUrls.tokenGenerationApi),
        body: body.toJson(),
        headers: {"content-type": "application/x-www-form-urlencoded"});
  }

  ///The Autosuggest API helps users to complete queries faster by adding intelligent search capabilities to your web or mobile app.
  ///This API returns a list of results as well as suggested queries as the user types in the search field.
  ///This API also supports Hindi language. If a user enters query in hindi language he will get results in Hindi.
  Future<http.Response> getAutoSuggestions(
      SuggestionQueryParams params, AuthInfo authInfo) async {
    String url = "${BaseUrls.autoSuggestApi}${params.toQueryString()}";
    var res = await http.get(Uri.parse(url), headers: {
      "Authorization": "${authInfo.tokenType} ${authInfo.accessToken}"
    });
    return res;
  }

  ///The Still Map Image API creates a map based on URL parameters sent through a standard HTTP request and returns the map as an image which you can display on your application.
  ///The API lets you embed MapmyIndia Maps image according to geo-position, pixel size and zoom level of the map on your application without requiring any dynamic page loading.
  ///The image can be a retina image and markers can be added to the image to indicate position of any object.
  ///
  /// return Url which can be used with [Image.network]
  Future<String> getStillMapImageUrl(StillMapImageQueryParams params) async {
    String url =
        "${BaseUrls.stillMapApi}/${params.restKey}/still_image${params.toQueryString()}";
    return url;
  }
}
