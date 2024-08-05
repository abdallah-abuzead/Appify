part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  static bool _loading = false;

  bool getLoading() => _loading;

  void setLoading(bool value) => _loading = value;

  @override
  List<Object> get props => [];
}

// ===============================================
class AuthInitial extends AuthState {}

// ===============================================
class AuthLoadingState extends AuthState {}

// ===============================================
class UnauthorizedAuthState extends AuthState {
  final String message;

  const UnauthorizedAuthState({required this.message});
}
// ===============================================

class AuthValidationErrorState extends AuthState {
  final Map<String, dynamic>? errors;

  const AuthValidationErrorState({required this.errors});
}

// ===============================================

class SuccessGetCachedUserState extends AuthState {
  final User user;

  const SuccessGetCachedUserState({required this.user});
}

class NoUserCachedState extends AuthState {}

// ===============================================

class SuccessSignUpState extends AuthState {
  const SuccessSignUpState();
}

class FailedSignUpState extends AuthState {
  final String message;

  const FailedSignUpState({required this.message});
}

// ===============================================

class SuccessUpdateInfoState extends AuthState {
  const SuccessUpdateInfoState();
}

class FailedUpdateInfoState extends AuthState {
  final String message;

  const FailedUpdateInfoState({required this.message});
}

// ===============================================

class SuccessSignInState extends AuthState {
  final User user;

  const SuccessSignInState({required this.user});
}

class FailedSignInState extends AuthState {
  final String message;

  const FailedSignInState({required this.message});
}

// ===============================================
class SuccessVerifyOTPState extends AuthState {
  final Map<String, dynamic> data;
  const SuccessVerifyOTPState({required this.data});
}

class FailedVerifyOTPState extends AuthState {
  final String message;
  const FailedVerifyOTPState({required this.message});
}

// ===============================================
class SuccessSendOTPState extends AuthState {
  final String message;
  const SuccessSendOTPState({required this.message});
}

class FailedSendOTPState extends AuthState {
  final String message;
  const FailedSendOTPState({required this.message});
}
// ===============================================
