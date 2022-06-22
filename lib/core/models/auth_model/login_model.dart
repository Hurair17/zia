// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogInModel {
  String? email;
  String? password;
  LogInModel({this.email, this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) =>
      LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
