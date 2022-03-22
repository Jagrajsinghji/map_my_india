///The result object which contains the token generated from Token Generation API.
class AuthInfo {
  AuthInfo._(
    this._clientId, {
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.scope,
    required this.projectCode,
  });

  ///example: 0XXXXXXf-dXX0-4XX0-8XXa-eXXXXXXXXXX6
  late final String accessToken;

  ///example: bearer
  late final String tokenType;

  ///example: 86499
  late final int expiresIn;

  /// example: READ
  late final String scope;

  ///example: prj1234567890987654321
  late final String projectCode;

  late final String _clientId;

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return AuthInfo._(json['client_id'],
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in'],
        scope: json['scope'],
        projectCode: json['project_code']);
  }
}
