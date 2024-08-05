import 'package:appify/modules/home/data/models/workshop.dart';
import 'package:appify/modules/reservations/data/repositories/reservations_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure_message.dart';
import '../../../../../core/errors/failures.dart';

part 'reservations_actions_state.dart';

class ReservationsActionsCubit extends Cubit<ReservationsActionsState> {
  final ReservationsRepository repository;

  ReservationsActionsCubit({required this.repository}) : super(ReservationsActionsInitial());

  static ReservationsActionsCubit of(context) => BlocProvider.of(context);

  // ====================================================================
  reserve({required Workshop workshop}) async {
    emit(LoadingReservationsActionsState());
    final response = await repository.reserve(workshop: workshop);
    response.fold(
      (failure) {
        if (failure is ValidationFailure) {
          emit(ValidationReservationsActionsState(errors: failure.errors));
        } else {
          emit(FailedCreateReservationState(message: FailureMessages.getMessage(failure)));
        }
      },
      (message) {
        emit(SuccessCreateReservationState(message: message));
      },
    );
  }
}
