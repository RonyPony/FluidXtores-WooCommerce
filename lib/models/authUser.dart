class AuthedUser {
  String? token;
  String? email;
  String? nickname;
  String? displayName;

  AuthedUser();

  AuthedUser.fromJSON(dynamic json) {
    this.token = json['token'];
    this.email = json['user_email'];
    this.nickname = json['user_nicename'];
    this.displayName = json['user_display_name'];
  }
}
