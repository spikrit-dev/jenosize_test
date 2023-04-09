import 'package:flutter/material.dart';
import 'package:jenosize/presentation/home/home.dart';
import 'package:jenosize/presentation/maps/maps.dart';
import 'package:jenosize/presentation/restuarant/restuarant.dart';
import 'package:jenosize/presentation/splash/splash.dart';

import 'core/fade_page_route.dart';

enum Routes { splash, home, wrapper, search, maps }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String wrapper = '/wrapper';
  static const String search = '/home/search';
  static const String maps = '/home/maps';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.wrapper: _Paths.wrapper,
    Routes.search: _Paths.search,
    Routes.maps: _Paths.maps,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashPage());

      case _Paths.search:
        return FadeRoute(page: const RestuarantPage());

      case _Paths.maps:
        return FadeRoute(page: const JenosizeMaps());

      case _Paths.home:
      default:
        return FadeRoute(page: const HomePage());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
