import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

// No internet connection
class OfflineFailure extends Failure {}

// Server Error (api doesn't return data from server)
class ServerFailure extends Failure {}

// Validation
class ValidationFailure extends Failure {
  final Map<String, dynamic> errors;
  ValidationFailure({required this.errors});
}

// Unauthorized
class UnauthorizedFailure extends Failure {
  final String? message;
  UnauthorizedFailure({this.message});
}

// data type change failure
class DataTypeChangeFailure extends Failure {}

// Empty cash failure
class EmptyCacheFailure extends Failure {}
