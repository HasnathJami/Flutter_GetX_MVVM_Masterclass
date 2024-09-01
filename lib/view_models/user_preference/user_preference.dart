import 'package:flutter_getx_mvvm_masterclass/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', user.token.toString());
    sharedPreferences.setBool('isLogin', user.isLogin!);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    bool? isLogin = sharedPreferences.getBool('isLogin');
    return UserModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return true;
  }
}
