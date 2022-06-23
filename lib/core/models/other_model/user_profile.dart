import 'dart:io';

import 'package:dio/dio.dart' as dio;

class UserProfile {
  String? name;
  String? uuid;
  String? email;
  String? fcmToken;
  String? emailVerifiedAt;
  String? phone;
  String? imageUrl;
  String? imageUrldCopy;
  String? gender;
  String? location;
  String? mobile;
  String? dob;
  String? age;
  String? roleId;
  File? fileImage;

  UserProfile(
      {this.name,
      this.email,
      this.uuid,
      this.fcmToken,
      this.roleId,
      this.emailVerifiedAt,
      this.phone,
      this.imageUrl,
      this.imageUrldCopy,
      this.gender,
      this.location,
      this.mobile,
      this.dob,
      this.age});

  UserProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uuid = json['uuid'];
    roleId = json['role_id'];
    // fcmToken = json['fcm_token'];
    // emailVerifiedAt = json['email_verified_at'];
    phone = json['phone_number'];
    imageUrl = json['image_url'];
    imageUrldCopy = json['image_url'];
    gender = json['gender'];
    age = json['age'];
    // location = json['location'];
    // dob = json['dob'];
  }

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.name;
    data['email'] = this.email;
    data['role_id'] = this.roleId;
    // data['age'] = this.age;
    // data['fcmToken'] = this.fcmToken;
    data['phone_number'] = this.phone;
    // data['image_url'] = this.imageUrl != null
    //     ? await dio.MultipartFile.fromFile(this.imageUrl!)
    //     : null;
    // data['gender'] = this.gender;
    // data['location'] = this.location;
    return data;
  }

  toJson2() async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    // data['role_id'] = this.roleId;
    // data['age'] = this.age;
    // data['fcmToken'] = this.fcmToken;
    data['phone_number'] = this.phone;
    data['image_url'] = this.fileImage != null
        ? await dio.MultipartFile.fromFile(this.fileImage!.path)
        : null;
    // data['gender'] = this.gender;
    // data['location'] = this.location;
    return data;
  }

  deepCopy() {
    return UserProfile(
        name: this.name,
        email: this.email,
        fcmToken: this.fcmToken,
        phone: this.phone,
        imageUrl: this.imageUrl,
        gender: this.gender,
        location: this.location);
  }
}
