import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../screens/splash_screen/splash_screen.dart';

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('network_error_title'.tr),
      content: Text('network_error_content_plz_try_again'.tr),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAll(SplashPage());
            },
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ))
      ],
    );
  }
}
