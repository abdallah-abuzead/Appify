import '../../../../core/constants/app_url.dart';
import '../../../../core/network/api_handler.dart';
import '../../../../core/network/api_helper.dart';
import '../models/login_request.dart';
import '../models/user.dart';

class AuthRemoteDataSource {
  Future<User> signIn({required LoginRequest request}) async {
    return ApiHandler.handleDataSourceRequest(
      onTry: () async => await ApiHelper.dio.post(AppUrl.login, data: request.toJson()),
      onSuccess: (response) => User.fromJson(response.data['data']),
    );
  }
}
