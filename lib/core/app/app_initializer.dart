import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_injections/app_injections.dart';
import '../bloc_observer/bloc_observer.dart';
import '../network/api_helper.dart';

class AppInitializer {
  static Future<void> initSettingsAndServices() async {
    await _initSettings();
    await _initServices();
  }

  static Future<void> _initSettings() async {
    await AppInjections.init();
    ApiHelper.initializeDio();
    _setBlocObserver();
    _setupAppOverlayAndLandscape();
  }

  static Future<void> _initServices() async {
    //initialize yor services,third parties,...
  }

  static void _setBlocObserver() => Bloc.observer = MyBlocObserver();

  static _setupAppOverlayAndLandscape() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        // Change to Brightness.light for light icons
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    // To close the landscape
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
