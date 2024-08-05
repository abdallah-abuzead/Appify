import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_input_fields/app_rounded_text_field.dart';
import 'package:appify/modules/auth/data/models/login_request.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets/app_images.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input_fields/input_label.dart';
import '../../../../core/widgets/app_text.dart';
import '../bloc/auth/auth_bloc.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = AuthBloc.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      children: [
        Image.asset(AppImages.logoPng, height: 80.h),
        20.heightBox,
        AppText('تسجيل دخول', fontWeight: FontWeight.w500, fontSize: 24.sp, textAlign: TextAlign.center),
        50.heightBox,
        //================================================================
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const InputLabel(label: 'رقم الجوال'),
              AppRoundedTextField(
                controller: bloc.phoneController,
                hint: '+996054123947',
                keyboardType: TextInputType.phone,
                fillColor: AppColors.background.shade100,
                filled: true,
                enabledBorderColor: Colors.transparent,
              ),
              20.heightBox,
              //============================================================
              const InputLabel(label: 'كلمة المرور'),
              AppRoundedTextField(
                controller: bloc.passwordController,
                hint: '*************',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                fillColor: AppColors.background.shade100,
                filled: true,
                enabledBorderColor: Colors.transparent,
              ),
              16.heightBox,
            ],
          ),
        ),
        20.heightBox,
        //================================================================
        AppButton(
          title: 'تسجيل دخول',
          onPressed: bloc.phoneController.text.isEmpty
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (formKey.currentState!.validate()) {
                    bloc.add(
                      SignInEvent(
                        request: LoginRequest(
                          phone: bloc.phoneController.text,
                          password: bloc.passwordController.text,
                        ),
                      ),
                    );
                  }
                },
        ),
        20.heightBox,
      ],
    );
  }
}
