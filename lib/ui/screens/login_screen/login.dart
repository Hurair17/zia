import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:recrutment_help_app/core/constant/color.dart';
import 'package:recrutment_help_app/core/models/auth_model/signup_model.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/forget_pass_screen.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login_view_model.dart';
import 'package:recrutment_help_app/ui/screens/signup_screen/signup_screen.dart';

import '../../custom_widget/down_elevated_btn.dart';
import '../../custom_widget/elevated_btn_for_social_sites.dart';
import '../../custom_widget/password_txt_form_field.dart';
import '../../custom_widget/signuploginWidget/signuploginRichText.dart';
import '../../custom_widget/top_svg_design.dart';
import '../../custom_widget/user_info_txt_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroler = TextEditingController();

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
                  const TopDesignForStartScreen(),
                  SizedBox(
                    height: 46.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(),
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
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  validation: value.emailValidation,
                                  onChanged: (val) {
                                    value.logInModel.email = val;
                                  },
                                ),
                                PassTxtFormField(
                                  hintText: 'Password',
                                  controller: passwordcontroler,
                                  // errorText: 'Invalid Password',
                                  iconpath: 'assets/icons/pass_lock_icon.svg',
                                  keyboardType: TextInputType.emailAddress,
                                  validation: value.passwordValidation,
                                  onChanged: (val) {
                                    value.logInModel.password = val;
                                  },
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
                                color: kprimaryColor,
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
                        DownElevetedButton(
                          buttonText: 'Login',
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              print('valida');
                            }
                          },
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
                        //Social Auth Buttons
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
                        SignUpLogInText(
                          text: 'Don\'t have an account. ',
                          color1: ksecondaryColor,
                          btnText: 'Sign Up',
                          btnColor: kprimaryColor,
                          btnlink: SignUp(),
                        ),
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

Widget textWidget() {
  return Column(
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
    ],
  );
}
