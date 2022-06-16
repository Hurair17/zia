import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

class DownElevetedButton extends StatelessWidget {
  DownElevetedButton({
    Key? key,
    this.formKey,
    this.link,
    this.buttonText,
  }) : super(key: key);

  final link;
  final String? buttonText;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey == null) {
          // return null;
          Get.to(link);
        } else {
          if (formKey!.currentState!.validate()) {
            Get.to(link);
          } else {}
        }
      },
      style: ElevatedButton.styleFrom(
        primary: kprimaryColor,
        onPrimary: Colors.white,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        minimumSize: Size(369.w, 57.h),
        maximumSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        alignment: Alignment.center,
      ),
      child: Text(
        '$buttonText',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
