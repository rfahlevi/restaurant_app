import 'package:flutter/material.dart';
import 'package:restaurant_app/src/authentication/data/local_datasource/auth_local_datasource.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/logo.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SplashDatasource.directToHomePage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.nastyGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo.title,
            AppLogo.subtitle,
          ],
        ),
      ),
    );
  }
}
