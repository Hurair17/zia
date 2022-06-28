class LogInModel {
  String? email;
  String? password;
  LogInModel({this.email, this.password});

  toJson() => {
        'email': email,
        'password': password,
      };
}
