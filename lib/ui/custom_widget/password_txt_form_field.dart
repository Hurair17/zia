import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recrutment_help_app/core/constant/color.dart';

// ignore: must_be_immutable
class PassTxtFormField extends StatefulWidget {
  String? hintText;
  String? errorText;
  TextInputType? keyboardType;
  // IconData? prefixicon;
  String iconpath;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  TextEditingController? control;

  PassTxtFormField({
    this.control,
    this.errorText,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    required this.iconpath,
    this.validation,
    Key? key,
  }) : super(key: key);

  @override
  State<PassTxtFormField> createState() => _PassTxtFormFieldState();
}

class _PassTxtFormFieldState extends State<PassTxtFormField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Material(
        borderRadius: BorderRadius.circular(5.r),
        elevation: 2.0,
        shadowColor: kshadowColor.withOpacity(0.4),
        child: TextFormField(
          controller: widget.control,
          validator: widget.validation,
          onChanged: widget.onChanged,
          obscureText: passwordVisible,
          decoration: InputDecoration(
            errorText: widget.errorText,
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
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF8E8E8E).withOpacity(0.5),
              fontSize: 14.sp,
              fontFamily: 'Poppins',
            ),
            prefixIcon: SvgPicture.asset(
              widget.iconpath,
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
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible ? Icons.visibility_off : Icons.visibility,
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
        ),
      ),
    );
  }
}
