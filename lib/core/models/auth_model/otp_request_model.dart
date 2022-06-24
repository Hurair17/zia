class OtpRequestModel {
  String? email;
  // String? password;
  OtpRequestModel({this.email});

  toJson() => {
        'email': this.email,
      };
}
