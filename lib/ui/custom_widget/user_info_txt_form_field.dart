// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../core/constant/color.dart';

// class TxtFormField extends StatelessWidget {
//   final String? hintText;
//   final String? errorText;
//   final TextInputType? keyboardType;
//   final String prefixicon;
//   final String? Function(String?)? validation;
//   final Function(String)? onChanged;
//   final TextEditingController? controller;

//   const TxtFormField({
//     this.controller,
//     this.hintText,
//     this.errorText,
//     this.keyboardType,
//     required this.prefixicon,
//     this.validation,
//     this.onChanged,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 20.h),
//       child: Stack(
//         children: [
//           Container(
//             height: 72.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5.r),
//               boxShadow: [
//                 BoxShadow(
//                   color: kshadowColor.withOpacity(0.07),
//                   blurRadius: 5.r,
//                   offset: Offset(0, 3.r),
//                 ),
//               ],
//             ),
//           ),
//           TextFormField(
//             controller: controller,
//             validator: validation,
//             onChanged: onChanged,
//             decoration: InputDecoration(
//               errorText: errorText,
//               errorBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.red,
//                 ),
//               ),
//               focusedErrorBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.red,
//                 ),
//               ),
//               hintText: hintText,
//               hintStyle: TextStyle(
//                 color: const Color(0xFF8E8E8E).withOpacity(0.5),
//                 fontSize: 14.sp,
//                 fontFamily: 'Poppins',
//               ),
//               prefixIcon: SvgPicture.asset(
//                 prefixicon,
//                 fit: BoxFit.scaleDown,
//               ),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color.fromARGB(255, 31, 126, 181).withOpacity(0.5),
//                   ),
//                   // borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(5.r)),
//               filled: true,
//               fillColor: const Color(0xFFF0F4F7),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(5.r),
//               ),
//             ),
//             cursorColor: const Color(0xFF8E8E8E),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recrutment_help_app/core/constant/color.dart';

// ignore: must_be_immutable
class TxtFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  // IconData? prefixicon;
  final String iconpath;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const TxtFormField({
    this.controller,
    this.errorText,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    required this.iconpath,
    this.validation,
    Key? key,
  }) : super(key: key);

  @override
  State<TxtFormField> createState() => _TxtFormFieldState();
}

class _TxtFormFieldState extends State<TxtFormField> {
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
            controller: widget.controller,
            validator: widget.validation,
            onChanged: widget.onChanged,
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
            ),
            // cursorColor: const Color(0xFF8E8E8E),
          ),
        ],
      ),
    );
  }
}
