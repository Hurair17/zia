import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/forget_pass_view_model.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/password_success_change_screen.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/down_elevated_btn.dart';
import '../../custom_widget/password_txt_form_field.dart';
import '../../custom_widget/top_svg_design.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgetPassViewModel>(
        create: (context) => ForgetPassViewModel(),
        child: Consumer<ForgetPassViewModel>(builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopDesignForStartScreen(),
                    SizedBox(
                      height: 46.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            topText(),
                            PassTxtFormField(
                              hintText: 'Password',
                              // errorText: 'Invalid Password',
                              iconpath: 'assets/icons/pass_lock_icon.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: model.passwordValidation,
                              onChanged: (val) {
                                model.resetPasswordModel.password = val;
                              },
                              control: TextEditingController(
                                  text: model.resetPasswordModel.password),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            PassTxtFormField(
                              hintText: 'Confirm Password',
                              // errorText: 'Invalid Password',
                              iconpath: 'assets/icons/pass_lock_icon.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: model.confirmValidation,
                              onChanged: (val) {
                                model.resetPasswordModel.confirmpassword = val;
                              },
                              control: TextEditingController(
                                  text:
                                      model.resetPasswordModel.confirmpassword),
                            ),
                            SizedBox(
                              height: 75.h,
                            ),
                            DownElevetedButton(
                              formKey: formKey,
                              link: const PasswordChangeSuccessfully(),
                              buttonText: 'Reset Password',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

// Extracted Widget
Widget topText() {
  return Column(
    children: [
      Text(
        'Reset Password',
        style: TextStyle(
          color: kprimaryColor,
          fontFamily: 'Poppins',
          fontSize: 32.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        'Please reset your password.',
        style: TextStyle(
          color: ksecondaryColor,
          fontFamily: 'Poppins',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 59.h,
      ),
    ],
  );
}
