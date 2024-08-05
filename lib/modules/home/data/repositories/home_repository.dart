import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_handler.dart';
import '../data_sources/home_remote_data_source.dart';
import '../models/workshop.dart';

class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository({required this.remoteDataSource});

  Future<Either<Failure, List<Workshop>>> getAllWorkshops() {
    return ApiHandler.handleRepoFunction(onTry: (() async => await remoteDataSource.getAllWorkshops()));
  }
}
