// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../onboarding_screen/onboarding_screen.dart';

// class SplashScreen extends StatefulWidget {
//   // make it stateless
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     _initialSetup();
//     super.initState();
//   }

//   _initialSetup() async {
//     await Future.delayed(const Duration(seconds: 2));
//     bool flag = await getVisitingFlag();
//     setVisitingFlag();
//     if (flag == true) {
//       Get.offAll(LoginScreen());
//     } else {
//       Get.offAll(OnboardingScreen());
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: SvgPicture.asset('assets/icons/splash_screen_logo.svg'),
//     ));
//   }
// }

// setVisitingFlag() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('alreadyUser', true);
// }

// getVisitingFlag() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getBool('alreadyUser') ?? false;
// }

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:recrutment_help_app/core/services/auth_service.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/otp_screen.dart';
import 'package:recrutment_help_app/ui/screens/home/home_screen.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

import '../../../core/services/database_service.dart';
import '../../../core/services/local_storage_services.dart';
import '../../custom_widget/dialoges/network_error_dialog.dart';
import '../../locator.dart';
import '../onboarding_screen/onboarding_screen.dart';
import '../otp_verification_screen/otp_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authService = locator<AuthService>();
  final _dbService = locator<DatabaseService>();
  final _localStorateService = locator<LocalStorageService>();
  final Logger log = Logger();

  @override
  void didChangeDependencies() {
    _initialSetup();
    super.didChangeDependencies();
  }

  _initialSetup() async {
    await _localStorateService.init();

    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print("NO INTERNET AVAIALABLE");
      Get.dialog(NetworkErrorDialog());
      return;
    }

//routing to the last onboarding screen user seen

    await Future.delayed(const Duration(seconds: 2));
    bool flag = await _localStorateService.getVisitingFlag();
    _localStorateService.setVisitingFlag();
    print(flag);

    if (flag == false) {
      await Get.offAll(() => OnboardingScreen());
    }
    await _authService.doSetup();

    ///checking if the user is login or not
    print('Login State: ${_authService.isLogin}');
    // print('Login State: ${_authService.otpVerified}');
    if (_authService.isLogin) {
      Get.offAll(() => HomeScreen());
    }
    // else if (_authService.otpVerified) {
    //   Get.to(() => const OtpScreenVerify());
    // }
    else {
      await Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(() => LoginScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset('assets/icons/splash_screen_logo.svg'),
    ));
  }
}
