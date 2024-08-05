import 'package:appify/modules/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/app/app_initializer.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/screens/bottom_nav_screen.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/widgets/cookbooks/toast.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            state.setLoading(true);
          } else if (state is AuthValidationErrorState) {
            state.setLoading(false);
            showToast(message: getErrorText('message', state.errors) ?? 'Invalid Credentials');
          } else if (state is FailedSignInState) {
            state.setLoading(false);
            showToast(message: state.message);
          } else if (state is SuccessSignInState) {
            state.setLoading(false);
            AppInitializer.recallData();
            AppRouter.offAll(const BottomNavScreen());
          } else {
            state.setLoading(false);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state.getLoading(),
            child: SignInForm(),
          );
        },
      ),
    );
  }
}
