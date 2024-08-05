part of 'workshops_cubit.dart';

abstract class WorkshopsState {}

final class WorkshopsInitial extends WorkshopsState {}

// ===============================================
class LoadingWorkshopsState extends WorkshopsState {}

// ===============================================
class UnauthorizedWorkshopsState extends WorkshopsState {
  final String message;
  UnauthorizedWorkshopsState({required this.message});
}

// ===============================================
class OfflineWorkshopsState extends WorkshopsState {
  final String message;
  OfflineWorkshopsState({required this.message});
}

// ===============================================
class ValidationWorkshopsState extends WorkshopsState {
  final Map<String, dynamic> errors;
  ValidationWorkshopsState({required this.errors});
}

// ===============================================
class SuccessGetAllWorkshopsState extends WorkshopsState {
  final List<Workshop> workshops;
  SuccessGetAllWorkshopsState({required this.workshops});
}

class FailedGetAllWorkshopsState extends WorkshopsState {
  final String message;
  FailedGetAllWorkshopsState({required this.message});
}
