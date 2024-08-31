import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_mvvm_masterclass/res/colors/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void changeFieldFocus(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //{ToastGravity.CENTER}
  static showToastMessage(String message, ToastGravity toastGravity) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: toastGravity);
  }

  static showSnackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
