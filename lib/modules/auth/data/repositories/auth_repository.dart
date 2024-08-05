import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_handler.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/login_request.dart';
import '../models/user.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  Future<Either<Failure, User>> signIn({required LoginRequest request}) async {
    return ApiHandler.handleRepoFunction(onTry: () async {
      final User user = await remoteDataSource.signIn(request: request);
      return user;
    });
  }
}
