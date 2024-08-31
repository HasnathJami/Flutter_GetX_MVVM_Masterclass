import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/res/assets/image_assets.dart';
import 'package:flutter_getx_mvvm_masterclass/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
      body: Image(
        image: AssetImage(ImageAssets.splashScreenImagePath),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Utils.showToastMessage("Hello", ToastGravity.CENTER);
      }),
    );
  }
}
