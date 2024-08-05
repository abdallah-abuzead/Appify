import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/app/app_initializer.dart';
import 'core/app/my_app.dart';
import 'core/app_locale/app_locale.dart';
import 'core/constants/app_url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initSettingsAndServices();
  runApp(
    EasyLocalization(
      supportedLocales: const [AppLocale.arabic, AppLocale.english],
      path: AppUrl.translations,
      startLocale: AppLocale.arabic,
      fallbackLocale: AppLocale.arabic,
      child: const MyApp(),
    ),
  );
}
