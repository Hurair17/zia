class OtpModel {
  String? otp;
  String? email;
  OtpModel({
    this.otp,
    this.email,
  });

  toJson() => {
        'OTP': this.otp,
        'email': this.email,
      };
}
