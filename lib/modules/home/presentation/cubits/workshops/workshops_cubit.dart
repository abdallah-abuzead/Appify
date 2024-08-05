import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure_message.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/models/workshop.dart';
import '../../../data/repositories/home_repository.dart';

part 'workshops_state.dart';

class WorkshopsCubit extends Cubit<WorkshopsState> {
  final HomeRepository repository;

  WorkshopsCubit({required this.repository}) : super(WorkshopsInitial());

  static WorkshopsCubit of(context) => BlocProvider.of(context);

  List<Workshop> workshops = [];

  // ====================================================================
  getAllWorkshops() async {
    emit(LoadingWorkshopsState());
    final response = await repository.getAllWorkshops();
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          emit(OfflineWorkshopsState(message: FailureMessages.getMessage(failure)));
        } else if (failure is ValidationFailure) {
          emit(ValidationWorkshopsState(errors: failure.errors));
        } else if (failure is UnauthorizedFailure) {
          emit(UnauthorizedWorkshopsState(message: FailureMessages.getMessage(failure)));
        } else {
          emit(FailedGetAllWorkshopsState(message: FailureMessages.getMessage(failure)));
        }
      },
      (workshops) {
        this.workshops = workshops;
        emit(SuccessGetAllWorkshopsState(workshops: workshops));
      },
    );
  }
}
