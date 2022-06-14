import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Container(
                  height: 176.h,
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
                          color: primaryColor,
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
                          color: secondaryColor,
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 59.h,
                      ),
                      TxtFormField(
                        hintText: 'Email or Phone Number',
                        errorText: 'Invalid email',
                        prefixicon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validation: value.emailValidation,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      PassTxtFormField(
                        hintText: 'Password',
                        errorText: 'Invalid Password',
                        prefixicon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
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

class TxtFormField extends StatelessWidget {
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  IconData? prefixicon;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  TxtFormField({
    this.errorText,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.prefixicon,
    this.validation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorText: errorText,
        errorBorder: const OutlineInputBorder(
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
