part of 'reservations_cubit.dart';

abstract class ReservationsState {}

final class ReservationsInitial extends ReservationsState {}

// ===============================================
class LoadingReservationsState extends ReservationsState {}

// ===============================================
class UnauthorizedReservationsState extends ReservationsState {
  final String message;
  UnauthorizedReservationsState({required this.message});
}

// ===============================================
class OfflineReservationsState extends ReservationsState {
  final String message;
  OfflineReservationsState({required this.message});
}

// ===============================================
class ValidationReservationsState extends ReservationsState {
  final Map<String, dynamic> errors;
  ValidationReservationsState({required this.errors});
}

// ===============================================
class SuccessGetAllReservationsState extends ReservationsState {
  final List<Reservation> reservations;
  SuccessGetAllReservationsState({required this.reservations});
}

class FailedGetAllReservationsState extends ReservationsState {
  final String message;
  FailedGetAllReservationsState({required this.message});
}
