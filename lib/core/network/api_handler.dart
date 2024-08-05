import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../app_injections/app_injections.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import 'network_checker.dart';

class ApiHandler {
  static NetworkChecker networkChecker = getIt<NetworkChecker>();

  static Future<T> handleDataSourceRequest<T>({
    required Function() onTry,
    required T Function(Response response) onSuccess,
  }) async {
    try {
      final Response response = await onTry();
      if (response.statusCode == 201 || response.statusCode == 200 || response.statusCode == 204) {
        return onSuccess(response);
        return _handleDataTypeException(response: response, onSuccess: onSuccess);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 422 || response.statusCode == 400) {
        throw ValidationException(errors: response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw ServerException();
    }
  }

  static Future<T> _handleDataTypeException<T>({
    required Response response,
    required T Function(Response response) onSuccess,
  }) async {
    try {
      return onSuccess(response);
    } catch (e, stack) {
      throw DataTypeChangeException();
    }
  }

  static Future<Either<Failure, T>> handleRepoFunction<T>({required Function() onTry}) async {
    if (await networkChecker.isConnected) {
      try {
        return Right(await onTry());
      } on ValidationException catch (e) {
        return Left(ValidationFailure(errors: e.errors));
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on DataTypeChangeException {
        return Left(DataTypeChangeFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
