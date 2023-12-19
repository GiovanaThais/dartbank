import 'package:dart_bank/core/themes/light/light_colors.dart';
import 'package:dart_bank/features/auth/login/login_page.dart';
import 'package:dart_bank/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  runApp(
      // EasyLocalization(
      //   supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      // path:
      //   'assets/translations', // <-- change the path of the translation files
      //fallbackLocale: const Locale('pt', 'BR'),
      const MyApp());
}
