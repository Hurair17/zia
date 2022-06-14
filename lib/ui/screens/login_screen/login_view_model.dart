import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Name';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid email");
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }
}
