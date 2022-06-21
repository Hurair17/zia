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
      child: Stack(
        children: [
          Container(
            height: 72.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: kshadowColor.withOpacity(0.07),
                  blurRadius: 5.r,
                  offset: Offset(0, 3.r),
                ),
              ],
            ),
          ),
          TextFormField(
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
              // focusColor: kprimaryColor,
              focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide.none,

                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 31, 126, 181).withOpacity(0.5),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF0F4F7),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.r),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  // color: ksecondaryColor,
                ),
              ),
            ),
            // cursorColor: const Color(0xFF8E8E8E),
          ),
        ],
      ),
    );
  }
}
