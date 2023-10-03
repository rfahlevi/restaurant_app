import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/router/router.dart';
import 'package:restaurant_app/src/authentication/bloc/login/login_bloc.dart';
import 'package:restaurant_app/src/authentication/bloc/register/register_bloc.dart';
import 'package:restaurant_app/src/authentication/data/repositories/auth_repositories.dart';
import 'package:restaurant_app/src/restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:restaurant_app/src/restaurant/bloc/show_restaurant/show_restaurant_bloc.dart';
import 'package:restaurant_app/src/restaurant/data/repositories/restaurant_repositories.dart';
import 'package:restaurant_app/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc(AuthRepositories())),
        BlocProvider(create: (context) => LoginBloc(AuthRepositories())),
        BlocProvider(create: (context) => GetAllRestaurantBloc(RestaurantRepositories())),
        BlocProvider(create: (context) => ShowRestaurantBloc(RestaurantRepositories())),
      ],
      child: MaterialApp.router(
        title: 'Rezto',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.rezto,
        routerConfig: router,
      ),
    );
  }
}
