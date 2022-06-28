class SignUpModel {
  String? fullName;
  String? email;
  String? password;
  String? confirmpassword;
  String? token;

  SignUpModel(
      {this.email,
      this.password,
      this.confirmpassword,
      this.fullName,
      this.token});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        fullName: json["name"],
        email: json["email"],
        password: json["password"],
        confirmpassword: json["password_confirmation"],
        token: json["token"],
      );

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = confirmpassword;
    data['token'] = token;

    return data;
  }
}
