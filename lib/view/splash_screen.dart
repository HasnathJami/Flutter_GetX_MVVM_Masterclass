import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/res/components/round_button.dart';

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
        title: Text('GetX MVVM'),
      ),
      // body: Image(
      //   image: AssetImage(ImageAssets.splashScreenImagePath),
      // ),
      body: Column(
        children: [
          // RoundButton(
          //   title: 'Login',
          //   onPress: () {},
          //   width: double.infinity,
          //   loading: true,
          // ),
          // RoundButton(title: 'Sign Up', onPress: () {}, width: 200),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Utils.showToastMessage("Hello", ToastGravity.CENTER);
      }),
    );
  }
}
