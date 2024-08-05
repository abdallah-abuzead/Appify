import 'package:appify/modules/reservations/data/models/reservation.dart';

import '../../../../core/constants/app_url.dart';
import '../../../../core/network/api_handler.dart';
import '../../../../core/network/api_helper.dart';
import '../../../home/data/models/workshop.dart';

class ReservationsRemoteDataSource {
  Future<String> reserve({required Workshop workshop}) {
    Map<String, dynamic> data = {
      "service_ids": [workshop.services!.first.id],
      "work_shop_id": workshop.id,
      "car_id": null,
      "type": "immediately"
    };
    return ApiHandler.handleDataSourceRequest(
      onTry: () async => await ApiHelper.dio.post(AppUrl.reserve, data: data),
      onSuccess: (response) => response.data['message'],
    );
  }

  Future<List<Reservation>> getAllReservations() {
    return ApiHandler.handleDataSourceRequest(
      onTry: () async => await ApiHelper.dio.get(AppUrl.reservations),
      onSuccess: (response) => (response.data['data'] as List).map((json) => Reservation.fromJson(json)).toList(),
    );
  }
}
