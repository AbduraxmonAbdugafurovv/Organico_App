import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/routes/routes.dart';
import 'package:organico/screens/auth/sign_in_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "forgot_password",
          onGenerateRoute: MyRoutes.instance.onGenerateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
      child: const SignInPage(),
    );
  }
}
