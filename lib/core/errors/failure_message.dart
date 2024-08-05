// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import '../constants/app_strings.dart';
import 'failures.dart';

class FailureMessages {
  static const String SERVER_FAILURE_MESSAGE = AppStrings.serverFailureMessage;
  static const String OFFLINE_FAILURE_MESSAGE = AppStrings.offlineFailureMessage;
  static const String UNAUTHORIZED_FAILURE_MESSAGE = AppStrings.unauthorizedFailureMessage;
  static const String DATA_TYPE_CHANGE_FAILURE_MESSAGE = AppStrings.dataTypeChangeFailureMessage;

  static String getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case UnauthorizedFailure:
        return UNAUTHORIZED_FAILURE_MESSAGE;
      case DataTypeChangeFailure:
        return DATA_TYPE_CHANGE_FAILURE_MESSAGE;
      default:
        return SERVER_FAILURE_MESSAGE;
    }
  }
}
