import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxtFormField extends StatelessWidget {
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  IconData? prefixicon;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  TxtFormField({
    Key? key,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.prefixicon,
    this.validation,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        prefixIcon: Icon(
          prefixicon,
          size: 30.h,
          color: const Color(0xFF8E8E8E).withOpacity(0.5),
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
    );
  }
}
