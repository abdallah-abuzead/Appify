import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/app_constants.dart';
import '../constants/app_url.dart';
import 'dio_interceptor.dart';

class ApiHelper {
  static final Dio dio = Dio();
  String? _userToken = '663|4vZUeyj573qT0eCITs8fT3ayIplaLlxqecTmkIY4dc0a04b7';

  static final ApiHelper _instance = ApiHelper._();

  ApiHelper._();

  factory ApiHelper() => _instance;

  static void initializeDio() {
    dio
      ..options.baseUrl = AppUrl.baseUrl
      ..options.receiveTimeout = Duration(seconds: AppConstants.dioDurationSeconds)
      ..options.connectTimeout = Duration(seconds: AppConstants.dioDurationSeconds)
      ..options.sendTimeout = Duration(seconds: AppConstants.dioDurationSeconds)
      ..options.responseType = ResponseType.json
      ..options.contentType = "application/json"
      ..options.receiveDataWhenStatusError = true
      ..options.validateStatus = (_) {
        return true;
      }
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept-Language': 'en-US',
        'Accept': 'application/json',
        "Authorization": "Bearer ${_instance._userToken}"
      }
      ..interceptors.addAll([
        Logging(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      ]);
  }

  static set userToken(String? userToken) {
    _instance._userToken = userToken;
    dio.options.headers.addAll({"Authorization": "Bearer ${_instance._userToken}"});
  }
}
