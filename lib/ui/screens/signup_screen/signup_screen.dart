import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recrutment_help_app/core/enum/view_state.dart';
import 'package:recrutment_help_app/ui/custom_widget/elevated_btn_for_social_sites.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';
import 'package:recrutment_help_app/ui/screens/signup_screen/signup_view_model.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/down_elevated_btn.dart';
import '../../custom_widget/model_progress_hud.dart';
import '../../custom_widget/password_txt_form_field.dart';
import '../../custom_widget/signuploginWidget/signuploginRichText.dart';
import '../../custom_widget/top_svg_design.dart';
import '../../custom_widget/user_info_txt_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(builder: (context, value, child) {
        return ModalProgressHUD(
          inAsyncCall: value.state == ViewState.loading,
          child: SafeArea(
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
                        // For the svg picture
                        const TopDesignForStartScreen(),

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
                              iconpath: 'assets/icons/person.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: value.nameValidation,
                              onChanged: (val) {
                                value.signUpModel.fullName = val;
                              },
                              controller: fullnamecontroller,
                            ),
                            TxtFormField(
                              hintText: 'Email',
                              iconpath: 'assets/icons/email_icon.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: value.emailValidation,
                              onChanged: (val) {
                                value.signUpModel.email = val;
                              },
                              controller: emailcontroller,
                            ),
                            PassTxtFormField(
                              hintText: 'Password',
                              iconpath: 'assets/icons/pass_lock_icon.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: value.passwordValidation,
                              onChanged: (val) {
                                value.signUpModel.password = val;
                              },
                              controller: passwordcontroller,
                            ),
                            PassTxtFormField(
                              hintText: 'Confirm Password',
                              iconpath: 'assets/icons/pass_lock_icon.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: value.confirmValidation,
                              onChanged: (val) {
                                value.signUpModel.confirmpassword = val;
                              },
                              controller: confirmpasswordcontroller,
                            ),

                            SizedBox(
                              height: 30.h,
                            ),

                            // Button for SignUp
                            DownElevetedButton(
                              ontap: () async {
                                if (formKey.currentState!.validate()) {
                                  // print('valida');
                                  if (formKey.currentState!.validate()) {
                                    await value.createNewAccount();
                                  }
                                }
                              },
                              buttonText: 'Sign Up',
                            ),
                            SizedBox(
                              height: 30.h,
                            ),

                            // Button for Social Sites
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              height: 45.h,
                            ),

                            // Down Text and Button
                            SignUpLogInText(
                              text: 'Already have an account. ',
                              color1: kprimaryColor,
                              btnText: 'Log In',
                              btnColor: kprimaryColor,
                              btnlink: LoginScreen(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
