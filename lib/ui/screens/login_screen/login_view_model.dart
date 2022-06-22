import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:recrutment_help_app/core/constant/api_end_point.dart';
import 'package:recrutment_help_app/core/models/auth_model/login_model.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

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
}
