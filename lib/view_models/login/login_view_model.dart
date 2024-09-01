import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm_masterclass/models/login/user_model.dart';
import 'package:flutter_getx_mvvm_masterclass/repository/login_repository/login_repository.dart';
import 'package:flutter_getx_mvvm_masterclass/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm_masterclass/utils/utils.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/user_preference/user_preference.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() {
    isLoading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.loginApi(data).then((value) {
      isLoading.value = false;
      if (value['error'] == 'user not found') {
        Utils.showSnackBar('login', value['error']);
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );
        // userPreference.saveUser(UserModel.fromJson(value)).then((value) {
        //   Get.toNamed(RouteName.homeView);
        // }).onError((error, stackTrace) {});
        userPreference.saveUser(userModel).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.homeView);
        }).onError((error, stackTrace) {});
        Utils.showSnackBar('login', 'Login Successful');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      isLoading.value = false;
      Utils.showSnackBar('Error', error.toString());
    });
  }
}
