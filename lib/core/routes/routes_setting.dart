import 'package:chatter/core/routes/routes_names.dart';
import 'package:chatter/core/widget/navigation_helper.dart.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/validation/bloc/validation_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/pages/intro_first_opeing.dart';
import 'package:chatter/feature/Authentication/presentation/pages/otp_screen.dart';
import 'package:chatter/feature/Chats%20List/presentation/UI/Screens/home.dart';
import 'package:chatter/feature/User%20Profile/ui/Screens/user_profile_page.dart';
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
        final phoneNumber = settings.arguments as Map<String, String>;
        final phone = phoneNumber['phone']!;
        final dialCode = phoneNumber['dialCode']!;

        return createAnimatedRoute(
          OtpScreen(phoneNumber: phone, dialCode: dialCode),
        );
      case RoutesNames.profile:
        final phoneNumber = settings.arguments as String;
        return createAnimatedRoute(UserProfilePage(phoneNumber: phoneNumber));
      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
