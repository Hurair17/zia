import 'package:flutter/material.dart';
import 'package:recrutment_help_app/ui/screens/onboarding_screen/screen1.dart';
import 'package:recrutment_help_app/ui/screens/onboarding_screen/screen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: [
            Screen1(controller: controller),
            Screen2(controller: controller),
          ],
        ),
      ),
    );
  }
}
