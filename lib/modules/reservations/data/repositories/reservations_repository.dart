import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_handler.dart';
import '../../../home/data/models/workshop.dart';
import '../data_sources/reservations_remote_data_source.dart';
import '../models/reservation.dart';

class ReservationsRepository {
  final ReservationsRemoteDataSource remoteDataSource;

  ReservationsRepository({required this.remoteDataSource});

  Future<Either<Failure, String>> reserve({required Workshop workshop}) {
    return ApiHandler.handleRepoFunction(onTry: (() async => await remoteDataSource.reserve(workshop: workshop)));
  }

  Future<Either<Failure, List<Reservation>>> getAllReservations() {
    return ApiHandler.handleRepoFunction(onTry: (() async => await remoteDataSource.getAllReservations()));
  }
}
