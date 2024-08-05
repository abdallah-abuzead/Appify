import 'package:appify/modules/reservations/data/models/reservation.dart';
import 'package:appify/modules/reservations/data/repositories/reservations_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure_message.dart';
import '../../../../../core/errors/failures.dart';

part 'reservations_state.dart';

class ReservationsCubit extends Cubit<ReservationsState> {
  final ReservationsRepository repository;

  ReservationsCubit({required this.repository}) : super(ReservationsInitial());

  static ReservationsCubit of(context) => BlocProvider.of(context);

  List<Reservation> reservations = [];

  // ====================================================================
  getAllReservations() async {
    emit(LoadingReservationsState());
    final response = await repository.getAllReservations();
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(OfflineReservationsState(message: FailureMessages.getMessage(failure)));
        } else if (failure is ValidationFailure) {
          emit(ValidationReservationsState(errors: failure.errors));
        } else if (failure is UnauthorizedFailure) {
          emit(UnauthorizedReservationsState(message: FailureMessages.getMessage(failure)));
        } else {
          emit(FailedGetAllReservationsState(message: FailureMessages.getMessage(failure)));
        }
      },
      (reservations) {
        this.reservations = reservations;
        emit(SuccessGetAllReservationsState(reservations: reservations));
      },
    );
  }
}
