import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/src/authentication/data/local_datasource/auth_local_datasource.dart';
import 'package:restaurant_app/src/authentication/presentation/login_page.dart';
import 'package:restaurant_app/src/authentication/presentation/register_page.dart';
import 'package:restaurant_app/src/authentication/presentation/splash_page.dart';
import 'package:restaurant_app/src/restaurant/presentation/detail_restaurant_page.dart';
import 'package:restaurant_app/src/restaurant/presentation/home_page.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
      redirect: (context, state) async {
        final isLogin = await AuthLocalDatasource.authCheck();
        if (isLogin) {
          return null;
        } else {
          return LoginPage.routeName;
        }
      },
    ),
    GoRoute(
      path: DetailRestaurantPage.routeName,
      builder: (context, state) => DetailRestaurantPage(
        restaurantId: int.parse(state.uri.queryParameters['restaurantId']!),
      ),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: DetailRestaurantPage(
          restaurantId: int.parse(state.uri.queryParameters['restaurantId']!),
        ),
      ),
    ),
  ],
);
