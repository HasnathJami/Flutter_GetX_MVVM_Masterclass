import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/user_preference/user_preference.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
