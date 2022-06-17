import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:recrutment_help_app/ui/custom_widget/otp.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/forget_pass_view_model.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/otp_verify_screen.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/down_elevated_btn.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgetPassViewModel>(
        create: (context) => ForgetPassViewModel(),
        child: Consumer<ForgetPassViewModel>(builder: (context, value, child) {
          return SafeArea(
              child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 176.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                        'assets/icons/auth_screen_design.svg',
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          'Verification Code has been sent to your registered email.',
                          style: TextStyle(
                            color: ksecondaryColor,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              //   Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       OtpTextField(
                              //         validation: value.oTPValidation,
                              //       ),
                              //       OtpTextField(
                              //         validation: value.oTPValidation,
                              //         // control: TextEditingController(
                              //         //   text: value.logInModel.password),
                              //       ),
                              //       OtpTextField(
                              //         validation: value.oTPValidation,
                              //       ),
                              //       OtpTextField(
                              //         validation: value.oTPValidation,
                              //       ),
                              //     ],
                              //   ),
                              FilledRoundedPinPut(),
                              SizedBox(
                                height: 28.h,
                              ),

                              //Button to verify otp
                              DownElevetedButton(
                                // formKey: formKey,
                                link: VerifyScreen(),
                                buttonText: 'Verify Code',
                              ),
                              SizedBox(
                                height: 59.h,
                              ),
                              Text(
                                'Resend code in ${15} seconds.',
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
        }));
  }
}

class OtpTextField extends StatelessWidget {
  final String? Function(String?)? validation;
  TextEditingController? control;

  OtpTextField({
    this.control,
    this.validation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: ksecondaryColorForBack,
      ),
      height: 61.h,
      width: 71.h,
      child: TextFormField(
        controller: control,
        validator: validation,
        onSaved: (value) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        // style: Theme.of(context).textTheme.headline6,
        style: TextStyle(
          color: kprimaryColor,
          fontFamily: 'Poppins',
          fontSize: 29.sp,
          fontWeight: FontWeight.w400,
        ),
        cursorColor: ksecondaryColor,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
