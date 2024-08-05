import 'package:appify/modules/home/presentation/cubits/workshops/workshops_cubit.dart';
import 'package:appify/modules/reservations/presentation/cubits/reservations/reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/auth/presentation/bloc/auth/auth_bloc.dart';
import '../app_injections/app_injections.dart';
import '../app_router/app_router.dart';
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

  static recallData() {
    ApiHelper.userToken = BlocProvider.of<AuthBloc>(AppRouter.currentContext!).currentUser?.token;
    WorkshopsCubit.of(AppRouter.currentContext!).getAllWorkshops();
    ReservationsCubit.of(AppRouter.currentContext!).getAllReservations();
  }
}
