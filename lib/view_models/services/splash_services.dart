import 'dart:async';

import 'package:flutter_getx_mvvm_masterclass/res/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
  }
}
