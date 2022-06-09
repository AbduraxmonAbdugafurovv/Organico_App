import 'package:flutter/material.dart';
import 'package:organico/model/model.dart';
import 'package:organico/screens/auth/view/confirm_number.dart';
import 'package:organico/screens/auth/view/forgot_password.dart';
import 'package:organico/screens/auth/view/reset_pass.dart';
import 'package:organico/screens/auth/view/sign_in_page.dart';
import 'package:organico/screens/auth/view/sign_up.dart';
import 'package:organico/screens/auth/view/splash_page.dart';
import 'package:organico/screens/home/bottom_navigation.dart';
import 'package:organico/screens/home/cart/cancel_page.dart';
import 'package:organico/screens/home/cart/my_bag.dart';
import 'package:organico/screens/home/explore/explore.dart';
import 'package:organico/screens/home/home/coupon_page.dart';
import 'package:organico/screens/home/home/info/info_page.dart';
import 'package:organico/screens/home/home/categies_page.dart.dart';
import 'package:organico/screens/home/home/search_page.dart';
import 'package:organico/screens/home/home/wishlist.dart';
import 'package:organico/screens/home/profile/changePasswords/change_password.dart';
import 'package:organico/screens/home/profile/chat/view/chat.dart';
import 'package:organico/screens/home/profile/confirm_number_profile.dart';
import 'package:organico/screens/home/profile/edit_profile.dart';
import 'package:organico/screens/home/profile/my_address.dart';
import 'package:organico/screens/home/profile/notification_setting.dart';
import 'package:organico/screens/home/profile/notifixation.dart';
import 'package:organico/screens/home/profile/payment_method.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes._init();
  static MyRoutes get instance => _instance;
  MyRoutes._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
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
      case "info_page":
        return route(InfoPage(info: args as Model));
      case "coupon_page":
        return route(const CouponPage());
      case "categories":
        return route(CategoriesPage(listCategory: args as List<Model>));
      case "explore":
        return route(const ExplorePage());
      case "notification":
        return route(const NotificationPage());
      case "notification_setting":
        return route(const NotificationSettingPage());
      case "edit_profile":
        return route(const EditProfile());
      case "confirm_number_profile":
        return route(const ConfirmPhoneProfile());
      case "change_password":
        return route(const ChangePassword());
      case "my_address":
        return route(const MyAddressPage());
      case "payment_method":
        return route(const PaymentMethodPage());
      case "wishlist":
        return route(const WishList());
      case "chat":
        return route(ChatPage(info: args as Model));
      case "my_bag":
        return route(const MyBagPage());
      case "cancel_page":
        return route(const CancelPage());
      case "search":
        return route(const SearchPage());
    }
    return null;
  }

  MaterialPageRoute<dynamic> route(page) =>
      MaterialPageRoute(builder: (context) => page);
}
