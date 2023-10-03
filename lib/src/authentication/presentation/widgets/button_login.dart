// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurant_app/src/authentication/bloc/login/login_bloc.dart';
import 'package:restaurant_app/src/authentication/data/model/request/login_request_model.dart';
import 'package:restaurant_app/src/authentication/presentation/widgets/button_child_loading.dart';
import 'package:restaurant_app/src/restaurant/presentation/home_page.dart';
import 'package:restaurant_app/theme/flash.dart';
import 'package:restaurant_app/theme/text_style.dart';

class ButtonLogin extends StatelessWidget {
  final TextEditingController emailC;
  final TextEditingController passwordC;
  const ButtonLogin({
    Key? key,
    required this.emailC,
    required this.passwordC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (loginData) {
            AppFlash.success(context: context, message: 'Login success !');
            context.pushReplacement(HomePage.routeName);
          },
          error: (error) {
            AppFlash.error(context: context, message: error);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  if (emailC.text.isEmpty || passwordC.text.isEmpty) {
                    AppFlash.error(context: context, message: 'Email or Password must be filled!');
                  } else {
                    final loginData = LoginRequestModel(
                      identifier: emailC.text,
                      password: passwordC.text,
                    );

                    context.read<LoginBloc>().add(
                          LoginEvent.verif(loginData: loginData),
                        );
                  }
                },
                child: Text(
                  'Login',
                  style: AppTextStyle.whiteMedium.copyWith(fontSize: 16),
                )),
          ),
          loading: () => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {},
              child: const ButtonChildLoading(),
            ),
          ),
        );
      },
    );
  }
}
