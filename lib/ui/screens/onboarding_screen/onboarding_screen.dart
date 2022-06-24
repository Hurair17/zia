import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constant/color.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final controller = PageController(initialPage: 0);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 547.h,
                left: 1.sw / 2 - 27.3.w,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  onDotClicked: (index) {
                    // controller.animateToPage(index,
                    //     duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                  effect: ExpandingDotsEffect(
                      dotHeight: 9.h,
                      dotWidth: 12.w,
                      strokeWidth: 1.0,
                      dotColor: ksmootheindicator,
                      activeDotColor: kprimaryColor),
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 135.h,
                        width: double.infinity,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Ellipse_onboarding_screen.svg',
                        height: 113.h,
                        width: 113.w,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 89.h,
                        right: 25.w,
                        child: TextButton(
                            onPressed: () {
                              Get.offAll(LoginScreen());
                            },
                            child: Text('SKIP',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: kprimaryColor,
                                    fontSize: 16.sp))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  SizedBox(
                    height: 447.h,
                    child: PageView(
                      controller: controller,
                      children: const [
                        OnBoardScreen(
                          path: 'assets/icons/onboard1.png',
                          text: 'Is recruting manually a hectic process?',
                        ),
                        OnBoardScreen(
                          path: 'assets/icons/onboard2.png',
                          text: 'Take your hiring test at home and get hired!',
                        ),
                      ],
                    ),
                  ),
                  Stack(children: [
                    SizedBox(
                      height: 174.h,
                      width: double.infinity,
                    ),
                    Positioned(
                      right: 0.h,
                      child: SvgPicture.asset(
                        'assets/icons/ellipse_oboard.svg',
                        height: 174.h,
                      ),
                    ),
                    Center(
                      child: IconButton(
                          onPressed: () {
                            // Get.to(widget);
                            if (index == 0) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              index++;
                            } else {
                              Get.offAll(LoginScreen());
                            }
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/arrow.svg',
                            height: 40.h,
                            width: 40.w,
                          )),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardScreen extends StatelessWidget {
  final String path;
  final String text;
  const OnBoardScreen({required this.path, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          path,
          width: 275.w,
          height: 192.h,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(
          height: 140.h,
        ),
        SizedBox(
          width: 233.w,
          child: Text(
            text,
            style: TextStyle(
                color: kprimaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 45.h,
        ),
      ],
    );
  }
}
