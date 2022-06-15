import 'package:flutter/cupertino.dart';

import '../../../core/models/auth_model/signup_model.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpModel signUpModel = SignUpModel();

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Name';
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }

  String? confirmValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Password';
    }
  }
}
