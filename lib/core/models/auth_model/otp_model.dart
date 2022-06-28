class OtpModel {
  String? otp;
  String? email;
  OtpModel({
    this.otp,
    this.email,
  });

  toJson() => {
        'OTP': otp,
        'email': email,
      };
}
