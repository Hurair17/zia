// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:recrutment_help_app/core/constant/color.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login_view_model.dart';

import '../../custom_widget/password_txt_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(builder: (context, value, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 176.h,
                  width: double.infinity,
                  child: SvgPicture.asset('assets/auth_screen_design.svg',
                      fit: BoxFit.cover),
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
                        'Please Sign In to continue',
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
                                prefixicon: Icons.email_outlined,
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
                                prefixicon: Icons.email_outlined,
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
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: kprimaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w100,
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
                          children: [
                            LoginScreenEvletedBtnForSocialSites(
                              path: 'assets/apple.svg',
                            ),
                            LoginScreenEvletedBtnForSocialSites(
                              path: 'assets/google.svg',
                            ),
                            LoginScreenEvletedBtnForSocialSites(
                              path: 'assets/facebook.svg',
                            ),
                          ])
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class LoginScreenEvletedBtnForSocialSites extends StatelessWidget {
  final String path;
  const LoginScreenEvletedBtnForSocialSites({
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: ksecondaryColorForBack,
        onPrimary: Colors.white,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        minimumSize: Size(105.w, 56.h),
        alignment: Alignment.center,
      ),
      child: SvgPicture.asset(path),
    );
  }
}

class TxtFormField extends StatelessWidget {
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  IconData? prefixicon;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  TxtFormField({
    Key? key,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.prefixicon,
    this.validation,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      decoration: InputDecoration(
        errorText: errorText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xFF8E8E8E).withOpacity(0.5),
          fontSize: 14.sp,
          fontFamily: 'Poppins',
        ),
        prefixIcon: Icon(
          prefixicon,
          size: 30.h,
          color: const Color(0xFF8E8E8E).withOpacity(0.5),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.r)),
        filled: true,
        fillColor: const Color(0xFFF0F4F7),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      cursorColor: const Color(0xFF8E8E8E),
    );
  }
}
