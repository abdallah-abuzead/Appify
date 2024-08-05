import 'package:appify/modules/home/presentation/cubits/workshops/workshops_cubit.dart';
import 'package:appify/modules/reservations/data/repositories/reservations_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/home/data/data_sources/home_remote_data_source.dart';
import '../../modules/home/data/repositories/home_repository.dart';
import '../../modules/reservations/data/data_sources/reservations_remote_data_source.dart';
import '../../modules/reservations/presentation/cubits/reservations/reservations_cubit.dart';
import '../../modules/reservations/presentation/cubits/reservations_actions/reservations_actions_cubit.dart';
import '../network/network_checker.dart';
import '../utils/caching_sevices/shared_preferences_services.dart';

var getIt = GetIt.instance;

class AppInjections {
  static Future<void> init() async {
    /// Blocs
    getIt.registerFactory(() => WorkshopsCubit(repository: getIt()));
    getIt.registerFactory(() => ReservationsActionsCubit(repository: getIt()));
    getIt.registerFactory(() => ReservationsCubit(repository: getIt()));

    /// Repository
    getIt.registerLazySingleton(() => HomeRepository(remoteDataSource: getIt()));
    getIt.registerLazySingleton(() => ReservationsRepository(remoteDataSource: getIt()));

    /// DataSources
    getIt.registerLazySingleton(() => HomeRemoteDataSource());
    getIt.registerLazySingleton(() => ReservationsRemoteDataSource());

    /// core
    getIt.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(connectionChecker: getIt()));

    /// External
    await _injectSharedPref();
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }

  static Future<void> _injectSharedPref() async {
    final sharedPref = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPref);
    getIt.registerLazySingleton<SharedPreferencesServices>(() => SharedPreferencesServicesImpl(prefs: getIt()));
  }
}
