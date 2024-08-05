class ServerException implements Exception {}

class OfflineException implements Exception {}

class ValidationException implements Exception {
  final Map<String, dynamic> errors;
  ValidationException({required this.errors});
}

class UnauthorizedException implements Exception {
  final String? message;
  UnauthorizedException({this.message});
}

class DataTypeChangeException implements Exception {}

class EmptyCacheException implements Exception {}
