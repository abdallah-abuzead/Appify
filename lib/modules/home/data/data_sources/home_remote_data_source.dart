import '../../../../core/constants/app_url.dart';
import '../../../../core/network/api_handler.dart';
import '../../../../core/network/api_helper.dart';
import '../models/workshop.dart';

class HomeRemoteDataSource {
  Future<List<Workshop>> getAllWorkshops() {
    Map<String, dynamic> data = {
      "service_ids": [4],
      "type": "immediately",
      "latitude": 30.05152034037031,
      "longitude": 31.33714619444068,
      "car_id": null
    };
    return ApiHandler.handleDataSourceRequest(
      onTry: () async => await ApiHelper.dio.post(AppUrl.workshops, data: data),
      onSuccess: (response) => (response.data['data'] as List).map((json) => Workshop.fromJson(json)).toList(),
    );
  }
}
