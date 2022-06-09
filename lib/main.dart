
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organico/core/constant/theme_constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/model/model.dart';
import 'package:organico/routes/routes.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';
import 'package:organico/screens/auth/view/sign_in_page.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/home/homescreen/cubit_homescren.dart';
import 'package:organico/screens/home/home/info/cubit_info.dart';
import 'package:organico/screens/home/profile/changePasswords/cubit/change_password_cubit.dart';
import 'package:organico/screens/home/profile/chat/cubit/chat_cubit.dart';
import 'package:organico/service/hive_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapter());
  await OrganicoService.openBox();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthCubit()),
      BlocProvider(create: (context) => HomeCubit()),
      BlocProvider(create: (context) => ChatCubit()),
      BlocProvider(create: (context) => ChangePasswordCubit()),
      BlocProvider(create: (context) => InfoCubit()),
      BlocProvider(create: (context) => HomeScreenCubit()),
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
          title: 'Organico',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          initialRoute: "bottom_navigation",
          onGenerateRoute: MyRoutes.instance.onGenerateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
      child: const SignInPage(),
    );
  }
}
