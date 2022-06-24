import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:recrutment_help_app/core/constant/color.dart';
import 'package:recrutment_help_app/core/models/auth_model/otp_model.dart';
import 'package:recrutment_help_app/ui/custom_widget/down_elevated_btn.dart';

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
  final otpModel = OtpModel();

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
              otpModel.otp = pin;
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
            print('value = ${otpModel.otp}');
          },

          buttonText: 'Verify Code',
        ),
      ],
    );
  }
}
