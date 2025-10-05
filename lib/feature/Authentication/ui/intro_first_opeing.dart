import 'package:chatter/core/constants/assets.dart';
import 'package:flutter/material.dart';

class IntroFirstOpening extends StatefulWidget {
  const IntroFirstOpening({super.key});

  @override
  State<IntroFirstOpening> createState() => _IntroFirstOpeningState();
}

class _IntroFirstOpeningState extends State<IntroFirstOpening>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  late final ValueNotifier<int> _currentIndexNotifier;

  final List<String> introScreens = [
    Assets.assetsImagesWelcome,
    Assets.assetsImagesStayConnected,
    Assets.assetsImagesCollaborate,
    Assets.assetsImagesSecureMessaging,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _currentIndexNotifier = ValueNotifier<int>(0);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToNextPage();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentIndexNotifier.value < introScreens.length - 1) {
      _currentIndexNotifier.value++;
      _pageController.animateToPage(
        _currentIndexNotifier.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _animationController.forward(from: 0);
    }
  }

  void _goToPrevious() {
    if (_currentIndexNotifier.value > 0) {
      _currentIndexNotifier.value--;
      _pageController.animateToPage(
        _currentIndexNotifier.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        final screenWidth = MediaQuery.of(context).size.width;
        if (details.globalPosition.dx < screenWidth / 2) {
          _goToPrevious();
        } else {
          _goToNextPage();
        }
      },
      child: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              _currentIndexNotifier.value = index;
              _animationController.forward(from: 0);
            },
            itemCount: introScreens.length,
            itemBuilder: (context, index) {
              return Image.asset(introScreens[index], fit: BoxFit.cover);
            },
          ),

          // Progress Bars
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentIndexNotifier,
              builder: (context, currentIndex, _) {
                return Row(
                  children: List.generate(introScreens.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            double value;
                            if (index < currentIndex) {
                              value = 1.0;
                            } else if (index == currentIndex) {
                              value = _animationController.value;
                            } else {
                              value = 0.0;
                            }
                            return LinearProgressIndicator(
                              value: value,
                              backgroundColor: Colors.white24,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
