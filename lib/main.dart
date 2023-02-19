import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:office_furniture_store/core/app_theme.dart';
import 'package:office_furniture_store/src/view/screen/intro_screen.dart';
import 'package:office_furniture_store/src/view/screen/loging.dart';
import 'package:office_furniture_store/src/view/screen/singup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: box.read('jwt') != null ? const IntroScreen() : Signup(),
      theme: AppTheme.lightTheme,
    );
  }
}
