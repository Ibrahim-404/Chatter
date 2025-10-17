import 'package:flutter/material.dart';

void customNotificationWidget(String message, BuildContext context) {
  final animationController = AnimationController(
    vsync: Navigator.of(context),
    duration: const Duration(milliseconds: 300),
  );
  final animation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
  );

  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: 40,
        left: 0,
        right: 0,
        bottom: 0,
        child: SlideTransition(
          position: animation,
          child: Material(
            elevation: 6,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.white),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  overlay.insert(overlayEntry);
  animationController.forward();
  Future.delayed(const Duration(seconds: 3), () {
    {
      overlayEntry.remove();
      animationController.dispose();
    }
  });
}
