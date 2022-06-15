import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recrutment_help_app/ui/custom_widget/elevated_btn_for_social_sites.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/password_txt_form_field.dart';
import '../../custom_widget/user_info_txt_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // For the svg picture and Create Account Text
              Stack(
                children: [
                  SizedBox(
                    height: 187.h,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 176.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                        'assets/icons/auth_screen_design.svg',
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 137.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      TxtFormField(
                        hintText: 'Full Name',
                        // errorText: 'Invalid email',
                        prefixicon: 'assets/icons/person.svg',
                        keyboardType: TextInputType.emailAddress,
                        // validation: value.emailValidation,
                        // onChanged: (val) {
                        //   value.logInModel.email = val;
                        // },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TxtFormField(
                        hintText: 'Email',
                        // errorText: 'Invalid email',
                        prefixicon: 'assets/icons/email_icon.svg',
                        keyboardType: TextInputType.emailAddress,
                        // validation: value.emailValidation,
                        // onChanged: (val) {
                        //   value.logInModel.email = val;
                        // },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PassTxtFormField(
                        hintText: 'Password',
                        // errorText: 'Invalid Password',
                        iconpath: 'assets/icons/pass_lock_icon.svg',
                        keyboardType: TextInputType.emailAddress,
                        //   validation: value.passwordValidation,
                        //   onChanged: (val) {
                        //     value.logInModel.password = val;
                        //   },
                        //   control: TextEditingController(
                        //       text: value.logInModel.password),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PassTxtFormField(
                        hintText: 'Confirm Password',
                        // errorText: 'Invalid Password',
                        iconpath: 'assets/icons/pass_lock_icon.svg',
                        keyboardType: TextInputType.emailAddress,
                        // validation: value.passwordValidation,
                        // onChanged: (val) {
                        //   value.logInModel.password = val;
                        // },
                        // control: TextEditingController(
                        //     text: value.logInModel.password),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                          } else {
                            print('error');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kprimaryColor,
                          onPrimary: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          minimumSize: Size(369.w, 57.h),
                          alignment: Alignment.center,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            LoginScreenEvletedBtnForSocialSites(
                              path: 'assets/icons/apple.svg',
                            ),
                            LoginScreenEvletedBtnForSocialSites(
                              path: 'assets/icons/google.svg',
                            ),
                            LoginScreenEvletedBtnForSocialSites(
                              path: 'assets/icons/facebook.svg',
                            ),
                          ]),
                      SizedBox(
                        height: 51.h,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'Already have account. ',
                              style: TextStyle(
                                  color: kprimaryColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: 'Log In',
                                style: TextStyle(
                                    color: kprimaryColor,
                                    fontFamily: 'Poppins',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(LoginScreen());
                                  }),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
