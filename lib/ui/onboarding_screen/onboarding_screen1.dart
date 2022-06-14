import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late SharedPreferences preferences;
  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('key', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Screen 1'),
    );
  }
}
