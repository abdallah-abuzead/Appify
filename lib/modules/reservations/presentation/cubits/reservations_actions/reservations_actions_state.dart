part of 'reservations_actions_cubit.dart';

abstract class ReservationsActionsState {}

final class ReservationsActionsInitial extends ReservationsActionsState {}

// ===============================================
class LoadingReservationsActionsState extends ReservationsActionsState {}

// ===============================================
class UnauthorizedReservationsActionsState extends ReservationsActionsState {
  final String message;
  UnauthorizedReservationsActionsState({required this.message});
}

// ===============================================
class OfflineReservationsActionsState extends ReservationsActionsState {
  final String message;
  OfflineReservationsActionsState({required this.message});
}

// ===============================================
class ValidationReservationsActionsState extends ReservationsActionsState {
  final Map<String, dynamic> errors;
  ValidationReservationsActionsState({required this.errors});
}

// ===============================================
class SuccessCreateReservationState extends ReservationsActionsState {
  final String message;
  SuccessCreateReservationState({required this.message});
}

class FailedCreateReservationState extends ReservationsActionsState {
  final String message;
  FailedCreateReservationState({required this.message});
}
