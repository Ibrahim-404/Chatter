// import 'package:chatter/core/routes/routes_names.dart';
import 'package:flutter/material.dart';

Route createAnimatedRoute(Widget screen) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideIn = Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
      );
      final slideOut = Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: secondaryAnimation,
          curve: Curves.easeInOutCirc,
        ),
      );
      return SlideTransition(
        position: slideIn,
        child: SlideTransition(position: slideOut, child: child),
      );
    },
  );
}

void customPop(BuildContext context, Widget previousScreen) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => previousScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideIn = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
        );

        final slideOut = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1, 0),
        ).animate(
          CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeInOutCubic,
          ),
        );
        return SlideTransition(
          position: slideIn,
          child: SlideTransition(position: slideOut, child: child),
        );
      },
    ),
  );
}
