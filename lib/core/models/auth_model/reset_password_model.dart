class ResetPasswordModel {
  String? email;
  String? otp;
  String? password;
  String? confirmPassword;

  ResetPasswordModel({
    this.email,
    this.otp,
    this.password,
    this.confirmPassword,
  });
  toJson() => {
        'email': email,
        'OTP': otp,
        'password': password,
        'password_confirmation': confirmPassword,
      };
}
