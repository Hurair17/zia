import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/down_elevated_btn.dart';
import '../../custom_widget/top_svg_design.dart';

class PasswordChangeSuccessfully extends StatelessWidget {
  const PasswordChangeSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopDesignForStartScreen(),
              SizedBox(
                height: 120.h,
              ),
              centerContainer(),
              SizedBox(
                height: 130.h,
              ),
              DownElevetedButton(
                ontap: () async {
                  Get.to(LoginScreen());
                },
                buttonText: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget centerContainer() {
  return Container(
    width: 316.h,
    height: 318.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ksecondaryColorForBack,
    ),
    child: Column(
      children: [
        SizedBox(
          height: 51.h,
        ),
        SizedBox(
          height: 118.h,
          width: 97.w,
          child: SvgPicture.asset('assets/icons/verify_logo.svg',
              fit: BoxFit.cover),
        ),
        SizedBox(
          height: 17.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            'Your Password has been changed successfully.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ksecondaryColor,
              fontFamily: 'Poppins',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
