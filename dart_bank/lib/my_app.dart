import 'package:dart_bank/core/themes/light/light_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'features/auth/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: LightColors.green, brightness: Brightness.light),
      //theme: AppTheme.light,
      home: const LoginPage(),
    );
  }
}
