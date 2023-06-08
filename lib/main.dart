import 'package:admin_dashboard/controllers/gym_provider.dart';
import 'package:admin_dashboard/screens/auth/login_screen.dart';
import 'package:admin_dashboard/screens/dash_board_screen.dart';
import 'package:admin_dashboard/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_provider.dart';
import 'controllers/controller.dart';

void main() {
  print(Get.width);
  print(Get.height);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Controller(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GymProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Responsive Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
