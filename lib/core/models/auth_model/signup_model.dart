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
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        confirmpassword: json["confirm_password"],
        token: json["token"],
      );
}
