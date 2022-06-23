import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/color.dart';

class LoginScreenEvletedBtnForSocialSites extends StatelessWidget {
  final String path;
  final ontap;
  const LoginScreenEvletedBtnForSocialSites({
    this.ontap,
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        primary: ksecondaryColorForBack,
        onPrimary: Colors.white,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        minimumSize: Size(105.w, 56.h),
        alignment: Alignment.center,
      ),
      child: SvgPicture.asset(
        path,
        height: 24.h,
        width: 23.w,
        // fit: BoxFit.scaleDown,
      ),
    );
  }
}
