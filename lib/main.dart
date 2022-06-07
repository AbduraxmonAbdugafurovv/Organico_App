import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/routes/routes.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';
import 'package:organico/screens/auth/view/sign_in_page.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';

void main() async {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthCubit()),
      BlocProvider(create: (context) => HomeCubit())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "sign_in",
          onGenerateRoute: MyRoutes.instance.onGenerateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
      child: const SignInPage(),
    );
  }
}