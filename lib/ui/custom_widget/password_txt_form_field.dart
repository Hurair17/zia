import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recrutment_help_app/core/constant/color.dart';

// ignore: must_be_immutable
class PassTxtFormField extends StatefulWidget {
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  IconData? prefixicon;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  PassTxtFormField({
    this.errorText,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.prefixicon,
    this.validation,
    Key? key,
  }) : super(key: key);

  @override
  State<PassTxtFormField> createState() => _PassTxtFormFieldState();
}

class _PassTxtFormFieldState extends State<PassTxtFormField> {
  @override
  bool passwordVisible = false;

  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordVisible,
      decoration: InputDecoration(
        errorText: widget.errorText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color(0xFF8E8E8E).withOpacity(0.5),
          fontSize: 14.sp,
          fontFamily: 'Poppins',
        ),
        prefixIcon: Icon(
          widget.prefixicon,
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
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: ksecondaryColor,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
      cursorColor: const Color(0xFF8E8E8E),
    );
  }
}
