import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recrutment_help_app/core/constant/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 140.h,
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
                  onPressed: () {},
                  child: Text('SKIP',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: kprimaryColor.withOpacity(0.7),
                          fontSize: 16.sp))),
            ),
          ],
        ),
        SizedBox(
          height: 120.h,
        ),
        SvgPicture.asset(
          'assets/icons/onboard_1.svg',
          width: 275.w,
          height: 222.h,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(
          height: 80.h,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: ExpandingDotsEffect(
              dotHeight: 9.h,
              dotWidth: 12.w,
              dotColor: ksecondaryColor,
              // spacing: 12,
              activeDotColor: kprimaryColor),
        ),
        SizedBox(
          height: 60.h,
        ),
        SizedBox(
          width: 203.w,
          height: 48.h,
          child: Text(
            'Is recruting manually a hectic process?',
            style: TextStyle(
                color: kprimaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Stack(children: [
          SizedBox(
            height: 167.h,
            width: double.infinity,
          ),
          Positioned(
            right: 0.h,
            child: SvgPicture.asset(
              'assets/icons/ellipse_oboard.svg',
              height: 167.h,
            ),
          ),
          Center(
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/arrow.svg',
                  height: 43.h,
                  width: 43.w,
                )),
          ),
        ]),
      ],
    );
  }
}
