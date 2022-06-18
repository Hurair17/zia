import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/forget_pass_view_model.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/otp_screen.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/down_elevated_btn.dart';
import '../../custom_widget/top_svg_design.dart';
import '../../custom_widget/user_info_txt_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ForgetPassViewModel(),
        child: Consumer<ForgetPassViewModel>(builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopDesignForStartScreen(),
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
                              'Forgot Password',
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
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 59.h,
                            ),
                            TxtFormField(
                              hintText: 'Email',
                              prefixicon: 'assets/icons/email_icon.svg',
                              keyboardType: TextInputType.emailAddress,
                              validation: model.emailValidation,
                              onChanged: (val) {
                                model.forgetPasswordModel.email = val;
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DownElevetedButton(
                              formKey: formKey,
                              link: const OtpScreen(),
                              buttonText: 'Proceed',
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
        }));
  }
}
