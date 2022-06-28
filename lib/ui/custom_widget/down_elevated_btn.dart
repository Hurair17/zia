import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

class DownElevetedButton extends StatelessWidget {
  const DownElevetedButton({
    Key? key,
    this.buttonText,
    this.ontap,
  }) : super(key: key);

  final ontap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
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
