import 'package:chatter/core/routes/routes_names.dart';
import 'package:chatter/feature/Authentication/ui/intro_first_opeing.dart';
import 'package:chatter/feature/Authentication/ui/opt_Screen.dart';
import 'package:chatter/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesSettings {

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesNames.welcome:
        return MaterialPageRoute(builder: (_) => IntroFirstOpening());
      case RoutesNames.signIn:
        return MaterialPageRoute(builder: (_) => OptScreen());
      case RoutesNames.home:
        // return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
