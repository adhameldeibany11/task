import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/View/Screens/Home/home_screen.dart';
import 'core/utils/app_colors.dart';

TaskColors appColors = TaskColors();

Future<void> main() async {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'din',
            ),
            home: HomeScreen()
        );
      },
    );
  }
}
