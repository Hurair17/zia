class LogInModel {
  String? email;
  String? password;
  LogInModel({this.email, this.password});

  toJson() => {
        'email': this.email,
        'password': this.password,
      };
}
