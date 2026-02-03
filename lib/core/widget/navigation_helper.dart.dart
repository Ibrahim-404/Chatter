// import 'package:chatter/core/routes/routes_names.dart';
import 'package:flutter/material.dart';

Route createAnimatedRoute(Widget screen) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 450),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutQuart,
        reverseCurve: Curves.easeInQuart,
      );

      final slideIn = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(curve);
      final slideOut = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-2.0, 0.0),
      ).animate(
        CurvedAnimation(parent: secondaryAnimation, curve: Curves.linear),
      );
      return SlideTransition(
        position: slideIn,

        child: SlideTransition(position: slideOut, child: child),
      );
    },
  );
}
