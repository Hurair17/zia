// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogInModel {
  String? email;
  String? password;
  LogInModel({this.email, this.password});

  toJson() => {
        'email': this.email,
        'password': this.password,
      };
}
