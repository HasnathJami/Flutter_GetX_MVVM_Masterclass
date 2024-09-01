import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/login/widgets/input_email_widget.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/login/widgets/input_password_widget.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/login/widgets/login_button_widget.dart';
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
  void dispose() {
    print('calledDispose');
    super.dispose();
  }

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
                  InputEmailWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  InputPasswordWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            LoginButtonWidget(
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
