import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recrutment_help_app/core/constant/color.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/reset_password_screen.dart';

import '../../custom_widget/down_elevated_btn.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 176.h,
                child: SvgPicture.asset('assets/icons/auth_screen_design.svg',
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 120.h,
              ),
              Container(
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
                        'Your verification code has been verified successfully.',
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
              ),
              SizedBox(
                height: 130.h,
              ),
              DownElevetedButton(
                // formKey: formKey,
                link: ResetPasswordScreen(),
                buttonText: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
