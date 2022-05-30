import 'package:flutter/material.dart';
import 'package:organico/screens/auth/sign_in_page.dart';
import 'package:organico/screens/auth/splash_page.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes._init();
  static MyRoutes get instance => _instance;
  MyRoutes._init();

  Route? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case "splash":
      return route(const SplashPage());
      case "sign_in":
      return route(const SignInPage());
    }
    return null;
  }

  MaterialPageRoute<dynamic> route(page) => MaterialPageRoute(builder: (context) => page);
}