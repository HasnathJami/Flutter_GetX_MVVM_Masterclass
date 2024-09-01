import 'package:flutter_getx_mvvm_masterclass/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm_masterclass/view/login/login_view.dart';
import 'package:flutter_getx_mvvm_masterclass/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => SplashScreen(),
            transitionDuration: Duration(microseconds: 250),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.loginView,
            page: () => LoginView(),
            transitionDuration: Duration(microseconds: 250),
            transition: Transition.leftToRight),
      ];
}
