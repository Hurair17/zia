import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 176.h,
              width: double.infinity,
              child: SvgPicture.asset('assets/icons/auth_screen_design.svg',
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            OtpTextField(),
                            OtpTextField(),
                            OtpTextField(),
                            OtpTextField(),
                          ],
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(OtpScreen());
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
                            'Verify Code',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 59.h,
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
  }
}

class OtpTextField extends StatelessWidget {
  const OtpTextField({
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
      child: TextField(
        decoration: const InputDecoration(border: InputBorder.none),
        style: Theme.of(context).textTheme.headline6,
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
