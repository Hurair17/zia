import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final text;
  final textColor;
  final onPressed;
  final color;
  final verticalPadding;
  final double? textSize;

  const RoundedButton(
      {Key? key,
      @required this.text,
      @required this.onPressed,
      this.textColor,
      this.verticalPadding,
      this.textSize = 20,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      colorBrightness: Brightness.light,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: color,
      onPressed: onPressed,
      child: Padding(
        padding: verticalPadding != null
            ? EdgeInsets.only(
                top: verticalPadding.toDouble(),
                bottom: verticalPadding.toDouble())
            : const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
