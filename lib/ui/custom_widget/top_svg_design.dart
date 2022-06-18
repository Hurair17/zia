import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopDesignForStartScreen extends StatelessWidget {
  const TopDesignForStartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176.h,
      width: double.infinity,
      child: SvgPicture.asset(
        'assets/icons/auth_screen_design.svg',
        fit: BoxFit.cover,
      ),
    );
  }
}
