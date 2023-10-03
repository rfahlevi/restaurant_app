import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restaurant_app/src/authentication/presentation/register_page.dart';
import 'package:restaurant_app/src/authentication/presentation/widgets/auth_form.dart';
import 'package:restaurant_app/src/authentication/presentation/widgets/button_login.dart';
import 'package:restaurant_app/theme/logo.dart';
import 'package:restaurant_app/theme/text_style.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailC;
  TextEditingController? passwordC;
  bool isHide = false;

  @override
  void initState() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailC?.dispose();
    passwordC?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLogo.title,
              AppLogo.subtitle,
              const Spacer(),
              Text(
                'Login',
                style: AppTextStyle.blackSemiBold.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 14),
              AuthForm(
                labelText: 'Email',
                hintText: 'Type your email',
                controller: emailC!,
              ),
              AuthForm(
                labelText: 'Password',
                hintText: 'Type your password',
                controller: passwordC!,
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                    child: Icon(isHide ? MdiIcons.eye : MdiIcons.eyeOff)),
                obscureText: isHide ? true : false,
              ),
              const SizedBox(height: 24),
              ButtonLogin(
                emailC: emailC!,
                passwordC: passwordC!,
              ),
              const Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?  ',
                    style: AppTextStyle.blackRegular,
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: AppTextStyle.nastyGreenSemiBold,
                        recognizer: TapGestureRecognizer()..onTap = () => context.push(RegisterPage.routeName),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
