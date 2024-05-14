class RequestTokenModel {
  final bool success;
  final String expiresAt;
  final String requestToken;

  RequestTokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      success: json['success'],
      expiresAt: json['expires_at'],
      requestToken: json['request_token'],
    );
  }
}
