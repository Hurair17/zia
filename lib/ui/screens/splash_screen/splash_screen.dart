import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initialSetup();
    super.initState();
  }

  _initialSetup() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.to(LoginScreen());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset('assets/splash_screen_logo.svg'),
    ));
  }
}
