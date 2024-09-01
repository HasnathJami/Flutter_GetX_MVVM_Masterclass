import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/utils/utils.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/login/login_view_model.dart';
import 'package:get/get.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewModel.emailController.value,
      focusNode: loginViewModel.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.showSnackBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value) {
        Utils.changeFieldFocus(context, loginViewModel.emailFocusNode.value,
            loginViewModel.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr, border: OutlineInputBorder()),
    );
  }
}
