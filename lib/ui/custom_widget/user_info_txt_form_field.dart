import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/color.dart';

class TxtFormField extends StatelessWidget {
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  String prefixicon;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  TxtFormField({
    Key? key,
    this.hintText,
    this.errorText,
    this.keyboardType,
    required this.prefixicon,
    this.validation,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Material(
        borderRadius: BorderRadius.circular(5.r),
        elevation: 2.0,
        shadowColor: kshadowColor.withOpacity(0.4),
        child: TextFormField(
          validator: validation,
          decoration: InputDecoration(
            errorText: errorText,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF8E8E8E).withOpacity(0.5),
              fontSize: 14.sp,
              fontFamily: 'Poppins',
            ),
            prefixIcon: SvgPicture.asset(
              prefixicon,
              fit: BoxFit.scaleDown,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.r)),
            filled: true,
            fillColor: const Color(0xFFF0F4F7),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          cursorColor: const Color(0xFF8E8E8E),
        ),
      ),
    );
  }
}
