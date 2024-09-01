import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/res/components/round_button.dart';
import 'package:flutter_getx_mvvm_masterclass/utils/utils.dart';
import 'package:get/get.dart';

import '../../view_models/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginViewModel.emailController.value,
                    focusNode: loginViewModel.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.showSnackBar('Email', 'Enter email');
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.changeFieldFocus(
                          context,
                          loginViewModel.emailFocusNode.value,
                          loginViewModel.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                        hintText: 'password_hint'.tr,
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => RoundButton(
                width: 200,
                title: 'login'.tr,
                loading: loginViewModel.isLoading.value,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    loginViewModel.loginApi();
                  }
                })),
          ],
        ),
      ),
    );
  }
}
