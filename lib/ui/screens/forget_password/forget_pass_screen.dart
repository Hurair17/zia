import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/user_info_txt_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                child: SvgPicture.asset('assets/icons/auth_screen_design.svg',
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 46.h,
                      ),
                      Text(
                        'Forget Password',
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
                        'Enter Your register email or number.',
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
                      ElevatedButton(
                        onPressed: () {
                          // if (formKey.currentState!.validate()) {
                          // } else {
                          //   print('error');
                          // }
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
