class UserLoginReponse {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userRegisterDate;
  String? lastLoginDate;

  UserLoginReponse(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userRegisterDate,
      this.lastLoginDate});

  UserLoginReponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    userRegisterDate = json['userRegisterDate'];
    lastLoginDate = json['lastLoginDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['userPassword'] = this.userPassword;
    data['userRegisterDate'] = this.userRegisterDate;
    data['lastLoginDate'] = this.lastLoginDate;
    return data;
  }
}
