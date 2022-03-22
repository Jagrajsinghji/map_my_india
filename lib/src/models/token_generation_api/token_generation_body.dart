class TokenGenerationBody {
  TokenGenerationBody({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
  });

  ///example: client_credentials
  ///
  /// The grant type applicable to the token. By default, it is set at "client_credentials".
  final String grantType;

  ///The client ID provided to thec client for accessing oAuth 2 based APIs.
  final String clientId;

  ///The client secret provided to thec client for accessing oAuth 2 based APIs.
  final String clientSecret;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['grant_type'] = grantType;
    _data['client_id'] = clientId;
    _data['client_secret'] = clientSecret;
    return _data;
  }
}
