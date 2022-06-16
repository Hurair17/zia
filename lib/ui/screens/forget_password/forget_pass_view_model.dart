import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../../../core/models/auth_model/forget_password_model.dart';

class ForgetPassViewModel extends ChangeNotifier {
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();
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
