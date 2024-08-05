import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure_message.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/models/login_request.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  User? currentUser;

  static AuthBloc of(context) => BlocProvider.of(context);

  final TextEditingController phoneController = TextEditingController(text: '0104004001');
  final TextEditingController passwordController = TextEditingController(text: '12345678');

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<SignInEvent>((event, emit) => _signInEventHandler(event, emit));
  }

// =======================================================================================

  _signInEventHandler(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await repository.signIn(request: event.request);
    response.fold(
      (failure) {
        if (failure is ValidationFailure) {
          emit(AuthValidationErrorState(errors: failure.errors));
        } else {
          emit(FailedSignInState(message: FailureMessages.getMessage(failure)));
        }
      },
      (user) {
        currentUser = user;
        emit(SuccessSignInState(user: user));
      },
    );
  }

// =======================================================================================
}
