import 'package:flutter/material.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/routes/routes.dart';

void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
