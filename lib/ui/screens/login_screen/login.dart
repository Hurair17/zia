import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:recrutment_help_app/core/constant/color.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/forget_pass_screen.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login_view_model.dart';
import 'package:recrutment_help_app/ui/screens/signup_screen/signup_screen.dart';

import '../../custom_widget/elevated_btn_for_social_sites.dart';
import '../../custom_widget/password_txt_form_field.dart';
import '../../custom_widget/user_info_txt_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 176.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'assets/icons/auth_screen_design.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: kprimaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Please Sign In to continue.',
                          style: TextStyle(
                            color: ksecondaryColor,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 59.h,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TxtFormField(
                                  hintText: 'Email or Phone Number',
                                  // errorText: 'Invalid email',
                                  prefixicon: 'assets/icons/email_icon.svg',
                                  keyboardType: TextInputType.emailAddress,
                                  validation: value.emailValidation,
                                  onChanged: (val) {
                                    value.logInModel.email = val;
                                  },
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                PassTxtFormField(
                                  hintText: 'Password',
                                  // errorText: 'Invalid Password',
                                  iconpath: 'assets/icons/pass_lock_icon.svg',
                                  keyboardType: TextInputType.emailAddress,
                                  validation: value.passwordValidation,
                                  onChanged: (val) {
                                    value.logInModel.password = val;
                                  },
                                  control: TextEditingController(
                                      text: value.logInModel.password),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(ForgetPasswordScreen());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: kprimaryColor.withOpacity(0.65),
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 38.h,
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
                            maximumSize: Size(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height),
                            alignment: Alignment.center,
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'or login with',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                color: ksecondaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
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
                          height: 43.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Don\'t have an account.',
                                style: TextStyle(
                                    color: ksecondaryColor,
                                    fontFamily: 'Poppins',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: ' Sign Up',
                                  style: TextStyle(
                                      color: kprimaryColor,
                                      fontFamily: 'Poppins',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(SignUp());
                                    }),
                            ]),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
