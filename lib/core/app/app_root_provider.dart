import 'package:appify/modules/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home/presentation/cubits/workshops/workshops_cubit.dart';
import '../../modules/reservations/presentation/cubits/reservations/reservations_cubit.dart';
import '../../modules/reservations/presentation/cubits/reservations_actions/reservations_actions_cubit.dart';
import '../app_injections/app_injections.dart';

class AppRootProvider extends StatelessWidget {
  final Widget child;

  const AppRootProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // auth
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        // home
        BlocProvider(create: (context) => getIt<WorkshopsCubit>()..getAllWorkshops()),
        // reservations
        BlocProvider(create: (context) => getIt<ReservationsActionsCubit>()),
        BlocProvider(create: (context) => getIt<ReservationsCubit>()..getAllReservations()),
      ],
      child: child,
    );
  }
}
