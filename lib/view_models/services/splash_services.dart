import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm_masterclass/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/user_preference/user_preference.dart';
import 'package:get/get.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      if (kDebugMode) {
        print(value.token);
        print(value.isLogin);
      }

      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
      }
    }).onError((error, stackTrace) {});
  }
}
