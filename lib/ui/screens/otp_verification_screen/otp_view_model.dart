import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:recrutment_help_app/ui/screens/home/home_screen.dart';

import '../../../core/enum/view_state.dart';
import '../../../core/models/auth_model/otp_model.dart';
import '../../../core/other/base_view_model.dart';
import '../../../core/services/auth_service.dart';
import '../../custom_widget/dialoges/signup_error_dialoge.dart';
import '../../locator.dart';

class OtpViewModel extends BaseViewModel {
  final otpModel = locator<OtpModel>();
  final log = Logger();
  AuthService _authService = AuthService();

  otpVerification() async {
    log.d('This is emails ${otpModel.toJson()}');

    setState(ViewState.loading);
    final response = await _authService.otpVerify(otpModel);

    if (response.success) {
      // clear();
      Get.to(() => const HomeScreen());
    } else {
      print("Sorry error occured=>${response.error.toString()}");
      Get.dialog(SignUpErrorDialog(
        errorMsg: response.error.toString(),
      ));
    }
    setState(ViewState.idle);
  }
}
