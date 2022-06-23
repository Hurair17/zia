import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CancelButton extends StatelessWidget {
  final double size;
  final double iconHeight;
  final double iconWidth;
  final onTap;
  CancelButton({
    this.size = 27,
    this.iconHeight = 23,
    this.iconWidth = 12,
    this.onTap,
  });

  onBackPressed() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap ??
          () {
            Get.back();
          },
      child: Container(
        height: size.h,
        width: size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 8, // has the effect of softening the shadow
              spreadRadius: 1.2, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0.4, // vertical, move down 10
              ),
            )
          ],
        ),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // ImageContainer(
            //   assetImage: "$assets/x.png",
            //   height: this.iconHeight, //23,
            //   width: this.iconWidth, //12,
            // ),
          ],
        ),
      ),
    );
  }
}
