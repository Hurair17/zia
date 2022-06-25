import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:recrutment_help_app/core/models/auth_model/login_model.dart';
import 'package:recrutment_help_app/core/models/auth_model/otp_model.dart';
import 'package:recrutment_help_app/core/models/auth_model/otp_request_model.dart';
import 'package:recrutment_help_app/core/models/auth_model/signup_model.dart';
import 'package:recrutment_help_app/core/models/body/reset_password_body.dart';

import '../../ui/custom_widget/dialoges/auth_dialoge.dart';
import '../../ui/locator.dart';
import '../models/auth_model/reset_password_model.dart';
import '../models/other_model/user_profile.dart';
import '../models/responses/auth_response.dart';
import '../models/responses/base_response/string_response_model.dart';
import '../models/responses/user_profile_responses.dart';
import 'database_service.dart';
import 'local_storage_services.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
///
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [signupWithApple]:
///
/// [signupWithGmail]:
///
/// [signupWithFacebook]:
///
/// [logout]:
///

class AuthService {
  late bool isLogin;
  // late bool otpVerified;
  final _localStorageService = locator<LocalStorageService>();
  final _dbService = locator<DatabaseService>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookAuth.instance;
  UserProfile? userProfile;

  // String? fcmToken;
  late bool isNotificationTurnOn;
  static final Logger log = Logger();

  ///
  /// [doSetup] Function does the following things:
  ///   1) Checks if the user is logged then:
  ///       a) Get the user profile data
  ///       b) Updates the user FCM Token
  ///
  doSetup() async {
    isLogin = _localStorageService.accessToken != null;
    if (isLogin) {
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      log.d('User is already logged-in');
      await _getUserProfile();
      // await _updateFcmToken();
    } else {
      log.d('User is not logged-in');
    }
  }

  _getUserProfile() async {
    UserProfileResponse response = await _dbService.getUserProfile();
    if (response.success!) {
      final userProfile = response.profile;
      print('Got User Data: ${userProfile!.toJson()}');
    } else {
      //TODO: Update the design of success dialogue according to the app design.
      Get.dialog(AuthDialog(title: 'Response', message: response.error!));
      print('Pakisatan: ${response.error}');
    }
  }

  ///
  /// Updating FCM Token here...
  ///
  // _updateFcmToken() async {
  //   // final fcmToken = await locator<NotificationsService>().getFcmToken();
  //   final deviceId = await DeviceInfoService().getDeviceId();
  //   final response = await _dbService.updateFcmToken(deviceId, fcmToken!);
  //   if (response.success!) {
  //     // userProfile!.fcmToken = fcmToken;
  //   }
  // }

  signupWithEmailAndPassword(SignUpModel body) async {
    late AuthResponse response;
    response = await _dbService.createAccount(body);
    if (response.success!) {
      // this.userProfile = UserProfile.fromJson(body.toJson());
      // _localStorageService.setAccessToken =
      //     response.accessToken; //updating access token
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      await _getUserProfile();

      // await _updateFcmToken();
    }
    return response;
  }

  otpRequest(OtpRequestModel body) async {
    late StringResponse response;
    response = await _dbService.otpRequest(body);
    if (response.success!) {
      // this.userProfile = UserProfile.fromJson(body.toJson());
      _localStorageService.setOtpAccessToken =
          response.accessToken; //updating access token
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      print('OTP REquest Screen ${response.success}');
      // await _getUserProfile();

      // await _updateFcmToken();
    }
    return response;
  }

  emailVerifiedOtpRequest(OtpRequestModel body) async {
    late StringResponse response;
    response = await _dbService.emailVerifiedOtpRequest(body);
    if (response.success!) {
      // this.userProfile = UserProfile.fromJson(body.toJson());
      _localStorageService.setOtpAccessToken =
          response.accessToken; //updating access token
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      print('OTP REquest Screen ${response.success}');
      // await _getUserProfile();

      // await _updateFcmToken();
    }
    return response;
  }

  otpVerify(OtpModel body) async {
    late StringResponse response;
    response = await _dbService.otpVerify(body);
    if (response.success!) {
      // this.userProfile = UserProfile.fromJson(body.toJson());
      _localStorageService.setAccessToken =
          response.accessToken; //updating access token
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      print('OTP REquest Screen ${response.success}');
      // await _getUserProfile();

      // await _updateFcmToken();
    }
    return response;
  }

  loginWithEmailAndPassword(LogInModel body) async {
    late AuthResponse response;
    response = await _dbService.loginWithEmailAndPassword(body);
    if (response.success!) {
      _localStorageService.setAccessToken = response.accessToken;
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      // await _getUserProfile();
      // if (isNotificationTurnOn) await _updateFcmToken();
    }
    return response;
  }

  forgetPasswordOtpVerify(OtpModel body) async {
    late StringResponse response;
    response = await _dbService.forgetPasswordOtpVerify(body);
    if (response.success!) {
      print('OTP REquest Screen ${response.success}');
    }
    return response;
  }

  resetPassword(ResetPasswordModel body) async {
    late AuthResponse response;
    response = await _dbService.resetPassword(body);
    if (response.success!) {
      _localStorageService.setAccessToken = response.accessToken;
      isNotificationTurnOn = _localStorageService.notificationFlag != null;
      // await _getUserProfile();
      // if (isNotificationTurnOn) await _updateFcmToken();
    }
    return response;
  }

  // resetPassword(ResetPasswordBody body) async {
  //   final AuthResponse response = await _dbService.resetPassword(body);
  //   if (response.success) {
  //     _localStorageService.setAccessToken = response.accessToken;
  //   }
  //   return response;
  // }

  ///
  /// Google SignIn
  ///
  ///
  // Future<AuthResponse>
  loginWithGoogle() async {
    late AuthResponse response;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      debugPrint('accessToken => ' + googleAuth.accessToken!);
      debugPrint('idToken => ' + googleAuth.idToken!);
      // response = await _dbService.loginWithGoogle(googleAuth.accessToken!);
      // if (response.success!) {
      //   if (response.success!) {
      //     _localStorageService.setAccessToken = response.accessToken;
      //     isNotificationTurnOn = _localStorageService.notificationFlag != null;
      //     await _getUserProfile();
      //     // if (isNotificationTurnOn) await _updateFcmToken();
      //   }
      // }
      // return response;
    } catch (e) {
      print('Exception @sighupWithGoogle: $e');
    }
    // return response;
  }

  loginWithFacebook() async {
    AuthResponse? response;
    try {
      final LoginResult result = await _facebookLogin.login();
      final AccessToken accessToken = result.accessToken!;
      print("Facebook access token => ${accessToken.token}");
      response = await _dbService.loginWithFacebook(accessToken.token);
      if (response.success!) {
        _localStorageService.setAccessToken = response.accessToken;
        isNotificationTurnOn = _localStorageService.notificationFlag != null;
        await _getUserProfile();
        // if (isNotificationTurnOn) await _updateFcmToken();
      }
      return response;
    } catch (e) {
      print('Exception @loginWithFacebook: $e');
    }
    return response;
  }
}
