import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpLogInText extends StatelessWidget {
  final String text;
  final Color color1;
  final Widget btnlink;
  final String btnText;
  final Color btnColor;

  const SignUpLogInText({
    required this.text,
    required this.color1,
    required this.btnlink,
    required this.btnText,
    required this.btnColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
                color: color1,
                fontFamily: 'Poppins',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
              text: btnText,
              style: TextStyle(
                  color: btnColor,
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(btnlink);
                }),
        ]),
      ),
    );
  }
}
