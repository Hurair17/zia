import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/forget_pass_view_model.dart';
import 'package:recrutment_help_app/ui/screens/forget_password/otp_verify_screen.dart';

import '../../../core/constant/color.dart';
import '../../custom_widget/down_elevated_btn.dart';
import '../../custom_widget/top_svg_design.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

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
                  const TopDesignForStartScreen(),
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
                              const FilledRoundedPinPut(),
                              // SizedBox(
                              //   height: 28.h,
                              // ),

                              //Button to verify otp

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

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({Key? key}) : super(key: key);

  @override
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = true;

  @override
  Widget build(BuildContext context) {
    int length = 4;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 71.w,
      height: 61.h,
      textStyle: GoogleFonts.poppins(
        fontSize: 29.sp,
        color: kprimaryColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return ChangeNotifierProvider(
        create: (context) => ForgetPassViewModel(),
        child: Consumer<ForgetPassViewModel>(builder: (context, model, child) {
          return Column(
            children: [
              SizedBox(
                child: Pinput(
                  length: length,
                  controller: controller,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    // setState(() => showError = pin != '5555');
                    model.otpModel.otp = pin;
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: borderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),

              //Button to verify otp
              DownElevetedButton(
                // formKey: formKey,
                ontap: () async {
                  // Get.to(EmailVerifyScreen());
                  print('value = ${model.otpModel.otp}');
                },

                buttonText: 'Verify Code',
              ),
            ],
          );
        }));
  }
}
