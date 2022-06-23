import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../cancel_button.dart';
import '../rounded_button.dart';

class SignUpErrorDialog extends StatelessWidget {
  final errorMsg;
  final ontap;
  SignUpErrorDialog({this.errorMsg, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: 67, right: 67),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 200.1.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 14.5, left: 15, right: 15, bottom: 27.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //cancel button
                  ontap != null
                      ? Container()
                      : CancelButton(
                          iconHeight: 22.h,
                          iconWidth: 12.w,
                        ),
                ],
              ),
              //second element
              Text(
                "$errorMsg",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: kprimaryColor,
                ),
              ),
              //button
              Container(
                height: 30.h,
                width: 113.w,
                child: RoundedButton(
                  verticalPadding: 2.0,
                  text: "OK",
                  textSize: 15,
                  color: kprimaryColor,
                  textColor: Colors.white,
                  onPressed: this.ontap ??
                      () {
                        Get.back();
                      },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
