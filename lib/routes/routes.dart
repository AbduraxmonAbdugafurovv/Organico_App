import 'package:flutter/material.dart';
import 'package:organico/screens/auth/view/confirm_number.dart';
import 'package:organico/screens/auth/view/forgot_password.dart';
import 'package:organico/screens/auth/view/reset_pass.dart';
import 'package:organico/screens/auth/view/sign_in_page.dart';
import 'package:organico/screens/auth/view/sign_up.dart';
import 'package:organico/screens/auth/view/splash_page.dart';
import 'package:organico/screens/home/view/bottom_navigation.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes._init();
  static MyRoutes get instance => _instance;
  MyRoutes._init();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "splash":
        return route(const SplashPage());
      case "sign_in":
        return route(const SignInPage());
      case "sign_up":
        return route(const SignUpPage());
      case "forgot_password":
        return route(const ForgotPassword());
      case "confirm":
        return route(const ConfirmPage());
      case "reset_password":
        return route(const ResetPasswordPage());
      case "bottom_navigation":
        return route(const BottomNavigationPage());
    }
    return null;
  }

  MaterialPageRoute<dynamic> route(page) =>
      MaterialPageRoute(builder: (context) => page);
}
