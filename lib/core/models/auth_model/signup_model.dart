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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.confirmpassword;
    data['token'] = this.token;

    return data;
  }
}
