import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:recrutment_help_app/core/constant/api_end_point.dart';
import 'package:recrutment_help_app/core/enum/view_state.dart';
import 'package:recrutment_help_app/core/models/auth_model/login_model.dart';
import 'package:recrutment_help_app/ui/screens/home/home_screen.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

import '../../../core/enum/social_auth_type.dart';
import '../../../core/models/responses/auth_response.dart';
import '../../../core/other/base_view_model.dart';
import '../../../core/services/auth_service.dart';
import '../../custom_widget/dialoges/signup_error_dialoge.dart';

class LoginViewModel extends BaseViewModel {
  LogInModel logInModel = LogInModel();
  AuthService _authService = AuthService();

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

  // Future login(String email, String password, Widget? link) async {
  //   try {
  //     Response response = await post(
  //         Uri.parse(
  //           '${EndPoints.login}',
  //         ),
  //         body: {
  //           'email': email,
  //           'password': password,
  //         });
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       debugPrint(
  //           'Account Login Successfully ${data['data']['name']}         ');
  //       // get.to(link);

  //     } else {
  //       debugPrint('Faild');
  //     }
  //   } catch (e) {
  //     debugPrint('Error Pakistan $e');
  //   }
  // }
  late AuthResponse response;
  loginWithEmailPassword() async {
    debugPrint("SIGNUPBODY is =====> ${logInModel.toJson()}");

    setState(ViewState.loading);

    response = await _authService.loginWithEmailAndPassword(logInModel);
    if (response.success!) {
      print("Login user successfully");
      // clear();
      Get.offAll(() => HomeScreen());
    } else {
      print("Sorry error occured=>${response.error.toString()}");
      Get.dialog(SignUpErrorDialog(
        errorMsg: response.error.toString(),
      ));
    }
    setState(ViewState.idle);
  }

  loginWithSocial(SocialAuthType type) async {
    setState(ViewState.loading);
    if (type == SocialAuthType.google) {
      response = await _authService.loginWithGoogle();
    } else if (type == SocialAuthType.facebook) {
      response = await _authService.loginWithFacebook();
    } else if (type == SocialAuthType.apple) {
      // response = await _authService.loginWithApple();
    }

    if (response.success!) {
      print("Login user successfully");
      // clear();
      Get.offAll(() => HomeScreen());
    } else {
      print("Sorry error occured=>${response.error.toString()}");
      Get.dialog(SignUpErrorDialog(
        errorMsg: response.error.toString(),
      ));
    }
    setState(ViewState.idle);
  }
}
