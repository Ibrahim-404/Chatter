import 'package:chatter/core/routes/routes_names.dart';
import 'package:chatter/core/widget/navigation_helper.dart.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/validation/bloc/validation_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/pages/intro_first_opeing.dart';
import 'package:chatter/feature/Authentication/presentation/pages/opt_Screen.dart';
import 'package:chatter/feature/injection_container.dart';
import 'package:chatter/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesSettings {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return createAnimatedRoute(const SplashScreen());
      case RoutesNames.welcome:
        return createAnimatedRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SendVarifyBloc(authRepo: sl())),
              BlocProvider(create: (context) => ValidationBloc()),
            ],

            child: IntroFirstOpening(),
          ),
        );

      case RoutesNames.signIn:
        return createAnimatedRoute(const OtpTextField());
      case RoutesNames.home:
      // return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
