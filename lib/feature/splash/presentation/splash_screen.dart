import 'dart:ui';
import 'package:chatter/core/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideRight;
  late Animation<Offset> _slideLeft;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pushReplacementNamed(context, RoutesNames.welcome);
      }
    });

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutExpo),
      ),
    );

    _slideRight = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(10, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1, 1.0, curve: Curves.easeInOut),
      ),
    );

    _slideLeft = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-10, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1, 1.0, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CurtainPanel(
              direction: 'left',
              slideAnimation: _slideLeft,
              scaleAnimation: _scaleAnimation,
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                'assets/icons/chat.png',
                width: 80,
                height: 80,
              ),
            ),
            CurtainPanel(
              direction: 'right',
              slideAnimation: _slideRight,
              scaleAnimation: _scaleAnimation,
            ),
          ],
        ),
      ),
    );
  }
}

class CurtainPanel extends StatelessWidget {
  final String direction;
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;

  const CurtainPanel({
    super.key,
    required this.direction,
    required this.slideAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          width: 30,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade800,
                Colors.green.shade900,
                Colors.black,
                Colors.green.shade900,
                Colors.grey.shade800,
              ],
              stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
