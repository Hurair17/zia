import 'package:flutter/material.dart';
import 'package:recrutment_help_app/core/models/auth_model/reset_password_model.dart';

import '../../../core/models/auth_model/forget_password_model.dart';

class ForgetPassViewModel extends ChangeNotifier {
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();
  ResetPasswordModel resetPasswordModel = ResetPasswordModel();
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

  String? oTPValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter OTP";
    } else {
      return null;
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

  // int get counter => _counter;
  // int counter = 10;
  // late Timer _timer;
  // void startTimer() {
  //   counter = 15;
  // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //   if (counter > 0) {
  //     counter--;
  //     notifyListeners();
  //   } else {
  //     _timer.cancel();
  //   }
  // });
  // }

}
