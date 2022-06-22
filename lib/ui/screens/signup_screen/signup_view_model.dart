import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:recrutment_help_app/core/constant/api_end_point.dart';
import 'package:recrutment_help_app/core/services/auth_service.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

import '../../../core/models/auth_model/signup_model.dart';
import '../../../core/services/api_service.dart';

class SignUpViewModel extends ChangeNotifier {
  // final _appUrl = AppUrl();
  // ApiService _apiService = ApiService();
  SignUpModel signUpModel = SignUpModel();
  // AuthService _authService = AuthService();

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

}
