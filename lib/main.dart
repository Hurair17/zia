import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recrutment_help_app/ui/screens/login_screen/login.dart';
import 'package:recrutment_help_app/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const GetMaterialApp(home: SafeArea(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return const Material(child: SafeArea(child: SplashScreen()));
      },
    );
  }
}
