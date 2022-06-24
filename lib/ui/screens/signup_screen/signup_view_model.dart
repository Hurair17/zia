import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:recrutment_help_app/core/constant/api_end_point.dart';
import 'package:recrutment_help_app/core/enum/view_state.dart';
import 'package:recrutment_help_app/core/models/auth_model/otp_request_model.dart';
import 'package:recrutment_help_app/core/services/auth_service.dart';
import 'package:recrutment_help_app/ui/screens/home/home_screen.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

import '../../../core/models/auth_model/otp_model.dart';
import '../../../core/models/auth_model/signup_model.dart';
import '../../../core/other/base_view_model.dart';
import '../../../core/services/api_service.dart';
import '../../custom_widget/dialoges/signup_error_dialoge.dart';
import '../../locator.dart';
import '../otp_verification_screen/otp_screen.dart';

class SignUpViewModel extends BaseViewModel {
  // final _appUrl = AppUrl();
  // ApiService _apiService = ApiService();
  SignUpModel signUpModel = SignUpModel();
  OtpRequestModel otpRequestModel = OtpRequestModel();
  final AuthService _authService = AuthService();
  final otpModel = locator<OtpModel>();

  final log = Logger();

  // apiService

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Name';
    }
    return null;
  }

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
    // String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    // RegExp regExp = RegExp(pattern);
    // if (regExp.hasMatch(password!)) {
    //   return null;
    // } else {
    //   return "must contain upper, lower character and number ";
    // }
    if (password!.length < 8) {
      return "Password must be 8 characters long";
    } else {
      return null;
    }
  }

  String? confirmValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    } else if (value != signUpModel.password) {
      return 'Password Does Not Match';
    }
    return null;
  }

  // ApiService.registerUser(appUrl)
  // ApiService().registerUser(){}
  // apiService.
  // Future<void> register(data) async {
  //   String url = AppUrl.signUp;
  //   final response = await _apiService.post(url: url, data: data);
  // }

  createNewAccount() async {
    log.e("SIGNUPBODY is =====> ${signUpModel.toJson()}");
    log.e('This is email ${otpRequestModel.toJson()}');
    log.e('This is email ${otpModel.email}');

    setState(ViewState.loading);
    final response = await _authService.signupWithEmailAndPassword(signUpModel);
    final otpresponse = await _authService.otpRequest(otpRequestModel);

    if (response.success && otpresponse.success) {
      // clear();
      Get.to(() => const OtpScreenVerify());
    } else {
      // print("Sorry error occured=>${response.error.toString()}");
      // print("OTP error occured=>${otpresponse.error.toString()}");
      if (!response.success) {
        Get.dialog(SignUpErrorDialog(
          errorMsg: response.error.toString(),
        ));
      } else {
        Get.dialog(SignUpErrorDialog(
          errorMsg: otpresponse.error.toString(),
        ));
      }
    }
    setState(ViewState.idle);
  }
}
