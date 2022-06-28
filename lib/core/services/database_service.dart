import 'package:dio/dio.dart';
import 'package:recrutment_help_app/core/models/auth_model/login_model.dart';
import 'package:recrutment_help_app/core/models/auth_model/otp_model.dart';
import 'package:recrutment_help_app/core/models/auth_model/otp_request_model.dart';
import 'package:recrutment_help_app/core/models/auth_model/signup_model.dart';
import 'package:recrutment_help_app/core/services/api_service.dart';

import '../constant/api_end_point.dart';
import '../models/auth_model/reset_password_model.dart';
import '../models/responses/auth_response.dart';
import '../models/responses/base_response/request_response.dart';
import '../models/responses/base_response/string_response_model.dart';
import '../models/responses/user_profile_responses.dart';

class DatabaseService {
  final ApiServices _apiServices = ApiServices();

  Future<UserProfileResponse> getUserProfile() async {
    final RequestResponse response =
        await _apiServices.post(url: '${EndPoints.baseUrl}${EndPoints.login}');
    return UserProfileResponse.fromJson(response.data);
  }

  //   Future<BaseResponse> updateFcmToken(String deviceId, String token) async {
  //   final RequestResponse response = await _apiServices.post(
  //     url: '${EndPoints.baseUrl}${EndPoints.fcm_token}',
  //     data: {
  //       'device_id': deviceId,
  //       'token': token,
  //     },
  //   );
  //   return BaseResponse.fromJson(response.data);
  // }

  Future<AuthResponse> loginWithEmailAndPassword(LogInModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.login}',
      data: FormData.fromMap(body.toJson()),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> createAccount(SignUpModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.signup}',
      data: FormData.fromMap(body.toJson()),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<StringResponse> resetPassword(ResetPasswordModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.resetPassword}',
      data: FormData.fromMap(body.toJson()),
    );
    return StringResponse.fromJson(response.data);
  }

  Future<StringResponse> otpRequest(OtpRequestModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.otpRequest}',
      data: FormData.fromMap(body.toJson()),
    );
    return StringResponse.fromJson(response.data);
  }

  Future<StringResponse> emailVerifiedOtpRequest(OtpRequestModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.forgetPasswordOtpRequest}',
      data: FormData.fromMap(body.toJson()),
    );
    return StringResponse.fromJson(response.data);
  }

  Future<StringResponse> otpVerify(OtpModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.otpVerify}',
      data: FormData.fromMap(body.toJson()),
    );
    return StringResponse.fromJson(response.data);
  }

  Future<StringResponse> forgetPasswordOtpVerify(OtpModel body) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.forgetPasswordOtpVerify}',
      data: FormData.fromMap(body.toJson()),
    );
    return StringResponse.fromJson(response.data);
  }

  Future<AuthResponse> loginWithFacebook(String accessToken) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.loginWithFacebook}',
      data: {'accessToken': accessToken},
    );
    return AuthResponse.fromJson(response.data);
  }

  // Future<AuthResponse> resetPassword(ResetPasswordBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     url: '${EndPoints.baseUrl}${EndPoints.reset_password}',
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  Future<AuthResponse> loginWithGoogle(String accessToken) async {
    final RequestResponse response = await _apiServices.post(
      url: '${EndPoints.baseUrl}${EndPoints.loginWithGoogle}',
      data: {'accessToken': accessToken},
    );
    return AuthResponse.fromJson(response.data);
  }
}
