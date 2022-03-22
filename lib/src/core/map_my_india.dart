import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:map_my_india/src/core/account_manager.dart';
import 'package:map_my_india/src/models/token_generation_api/token_generation_body.dart';
import 'package:map_my_india/src/network_layer/apis.dart';

import '../models/auto_suggest_api/auto_suggest_response.dart';
import '../models/auto_suggest_api/suggestion_query_params.dart';
import '../models/still_map_image_api/still_map_image_query_params.dart';
import '../models/token_generation_api/auth_info.dart';

class MapMyIndia {
  late AuthInfo _authInfo;
  final APIs _apIs = APIs();
  MapMyIndiaAccountManager? _manager;

  Future<void> configure(MapMyIndiaAccountManager accountManager) async {
    _manager = accountManager;
    _authInfo = await _generateAuthInfo(accountManager);
  }

  Future<AuthInfo> _generateAuthInfo(
      MapMyIndiaAccountManager accountManager) async {
    http.Response response = await _apIs.generateAuthInfo(TokenGenerationBody(
        grantType: "client_credentials",
        clientId: accountManager.clientId,
        clientSecret: accountManager.clientSecret));
    if (response.statusCode == 200) {
      return AuthInfo.fromJson(jsonDecode(response.body));
    } else {
      throw response.body;
    }
  }

  void _checkInitialisation() {
    if (_manager != null) return;
    throw "UnInitialised Error, Please call `configure` before calling any other method on this instance";
  }

  Future<AutoSuggestResponse> getAutoSuggestions(
      {required SuggestionQueryParams suggestionQueryParams}) async {
    _checkInitialisation();
    http.Response response =
        await _apIs.getAutoSuggestions(suggestionQueryParams, _authInfo);
    if (response.statusCode == 200) {
      return AutoSuggestResponse.fromJson(jsonDecode(response.body));
    } else {
      throw response.body;
    }
  }

  Future<String> getStillMapImageUrl(
      {required StillMapImageQueryParams stillMapImageQueryParams}) {
    _checkInitialisation();
    return _apIs.getStillMapImageUrl(stillMapImageQueryParams);
  }
}
