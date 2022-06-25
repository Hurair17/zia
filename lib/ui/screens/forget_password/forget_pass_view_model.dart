import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:recrutment_help_app/core/models/auth_model/reset_password_model.dart';
import 'package:recrutment_help_app/core/other/base_view_model.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/otp_screen.dart';

import '../../../core/enum/view_state.dart';
import '../../../core/models/auth_model/otp_model.dart';
import '../../../core/models/auth_model/otp_request_model.dart';
import '../../../core/services/auth_service.dart';
import '../../custom_widget/dialoges/signup_error_dialoge.dart';
import '../../locator.dart';
import 'otp_verify_screen.dart';

class ForgetPassViewModel extends BaseViewModel {
  OtpRequestModel otpRequestModel = OtpRequestModel();
  ResetPasswordModel resetPasswordModel = ResetPasswordModel();
  final AuthService _authService = AuthService();
  final otpModel = locator<OtpModel>();
  Logger log = Logger();

  String? emailValidation(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value!)) {
      return null;
    } else {
      return "Invalid email";
    }
  }

  String? passwordValidation(String? password) {
    if (password!.length < 8) {
      return "Password must be 8 characters long";
    } else {
      return null;
    }
  }

  String? confirmValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    } else if (value != resetPasswordModel.password) {
      return 'Password Does Not Match';
    }
    return null;
  }

  emailVerifiedOtpRequest() async {
    setState(ViewState.loading);
    final otpresponse =
        await _authService.emailVerifiedOtpRequest(otpRequestModel);
    if (otpresponse.success) {
      Get.to(const OtpScreen());
    } else {
      Get.dialog(SignUpErrorDialog(
        errorMsg: otpresponse.error.toString(),
      ));
    }
    setState(ViewState.idle);
  }

  // otpVerification() async {
  //   setState(ViewState.loading);
  //   log.e(otpModel.toJson());
  //   // final otpresponse = await _authService.otpVerify(otpModel);
  //   //   if (otpresponse.success) {
  //   //     Get.to(const OtpScreen());
  //   //   } else {
  //   //     Get.dialog(SignUpErrorDialog(
  //   //       errorMsg: otpresponse.error.toString(),
  //   //     ));
  //   //   }
  //   //   setState(ViewState.idle);
  // }

  otpVerification() async {
    log.d('This is emails ${otpModel.toJson()}');

    setState(ViewState.loading);
    final response = await _authService.forgetPasswordOtpVerify(otpModel);

    if (response.success) {
      // clear();
      Get.to(() => const VerifyScreen());
    } else {
      print("Sorry error occured=>${response.error.toString()}");
      Get.dialog(SignUpErrorDialog(
        errorMsg: response.error.toString(),
      ));
    }
    setState(ViewState.idle);
  }
}
