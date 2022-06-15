import 'package:flutter/material.dart';
import 'package:recrutment_help_app/core/models/auth_model/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  LogInModel logInModel = LogInModel();
  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Email';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid email");
    }
  }

  String? passwordValidation(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value!)) {
      return null;
    } else {
      return "must have upper, lower, spical ch, num ";
    }
  }
}
