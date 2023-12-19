import 'package:dart_bank/core/themes/light/light_colors.dart';
import 'package:dart_bank/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/themes/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: LightColors.green, brightness: Brightness.light),
      //theme: AppTheme.light,
      home: const LoginPage(),
    );
  }
}
