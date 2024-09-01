import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/services/splash_services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('GetX MVVM'),
      ),
      body: Center(
        child: Text(
          'welcome_back'.tr,
          textAlign: TextAlign.center,
        ),
      ),
      // body: Image(
      //   image: AssetImage(ImageAssets.splashScreenImagePath),
      // ),
      // body: Column(
      //   children: [
      //     // RoundButton(
      //     //   title: 'Login',
      //     //   onPress: () {},
      //     //   width: double.infinity,
      //     //   loading: true,
      //     // ),
      //     // RoundButton(title: 'Sign Up', onPress: () {}, width: 200),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // Utils.showToastMessage("Hello", ToastGravity.CENTER);
      // }),
    );
  }
}
