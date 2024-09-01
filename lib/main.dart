import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/localization/languages.dart';
import 'package:flutter_getx_mvvm_masterclass/res/routes/routes.dart';
import 'package:flutter_getx_mvvm_masterclass/view/home/home_view.dart';
import 'package:flutter_getx_mvvm_masterclass/view/login/login_view.dart';
import 'package:flutter_getx_mvvm_masterclass/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Mvvm',
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: LoginView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
