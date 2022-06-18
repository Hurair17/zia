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
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.length < 8) {
      return "Password must be 8 characters long";
    } else {
      return null;
    }
  }
}
