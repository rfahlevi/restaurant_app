// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/src/authentication/bloc/register/register_bloc.dart';
import 'package:restaurant_app/src/authentication/data/model/request/register_request_model.dart';
import 'package:restaurant_app/src/authentication/presentation/widgets/button_child_loading.dart';
import 'package:restaurant_app/src/restaurant/presentation/home_page.dart';
import 'package:restaurant_app/theme/flash.dart';

import 'package:restaurant_app/theme/text_style.dart';

class ButtonRegister extends StatelessWidget {
  final TextEditingController fullnameC;
  final TextEditingController usernameC;
  final TextEditingController emailC;
  final TextEditingController passwordC;
  const ButtonRegister({
    Key? key,
    required this.fullnameC,
    required this.usernameC,
    required this.emailC,
    required this.passwordC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (error) {
              AppFlash.error(context: context, message: error);
            },
            success: (registerData) {
              AppFlash.success(context: context, message: 'Register Success !');
              context.pushReplacement(HomePage.routeName);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return ElevatedButton(
                onPressed: () {
                  if (fullnameC.text.isEmpty ||
                      usernameC.text.isEmpty ||
                      emailC.text.isEmpty ||
                      passwordC.text.isEmpty) {
                    AppFlash.error(context: context, message: 'Data must be filled in completely!');
                  } else {
                    final registerData = RegisterRequestModel(
                      name: fullnameC.text,
                      password: passwordC.text,
                      email: emailC.text,
                      username: usernameC.text,
                    );

                    context.read<RegisterBloc>().add(
                          RegisterEvent.add(registerData: registerData),
                        );
                  }
                },
                child: Text(
                  'Register',
                  style: AppTextStyle.whiteMedium.copyWith(fontSize: 16),
                ),
              );
            },
            loading: () {
              return ElevatedButton(
                onPressed: () {},
                child: const ButtonChildLoading(),
              );
            },
          );
        },
      ),
    );
  }
}
