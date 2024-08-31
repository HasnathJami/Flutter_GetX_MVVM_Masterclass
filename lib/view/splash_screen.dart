import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        title: Text('Exception Handling'),
      ),
      body: Container(
        child: Center(
          child: Text("GETX MVVM"),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Utils.showToastMessage("Hello", ToastGravity.CENTER);
      }),
    );
  }
}
