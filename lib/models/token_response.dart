class TokenResponse {
    TokenResponse({
        this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.errorDescription
    });

    final String? accessToken;
    final String? tokenType;
    final int? expiresIn;
    final int? errorDescription;

    factory TokenResponse.fromJson(Map<String?, dynamic> json) => TokenResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        errorDescription: json["error_description"],
    );
}
