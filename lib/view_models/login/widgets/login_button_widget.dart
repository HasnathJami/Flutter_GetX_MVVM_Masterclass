import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/res/components/round_button.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/login/login_view_model.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;

  LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());

    return Obx(() => RoundButton(
        width: 200,
        title: 'login'.tr,
        loading: loginViewModel.isLoading.value,
        onPress: () {
          if (formKey.currentState!.validate()) {
            loginViewModel.loginApi();
          }
        }));
  }
}
