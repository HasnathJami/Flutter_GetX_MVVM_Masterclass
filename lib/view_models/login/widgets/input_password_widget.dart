import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/utils/utils.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/login/login_view_model.dart';
import 'package:get/get.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewModel.passwordController.value,
      focusNode: loginViewModel.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.isEmpty) {
          Utils.showSnackBar('Password', 'Enter password');
        }
      },
      onFieldSubmitted: (value) {},
      decoration: InputDecoration(
          hintText: 'password_hint'.tr, border: OutlineInputBorder()),
    );
  }
}
