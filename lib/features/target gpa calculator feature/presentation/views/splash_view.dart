import 'package:Target_GPA/core/utils/styles.dart';
import 'package:Target_GPA/features/target%20gpa%20calculator%20feature/presentation/views/home_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Styles.darkGradient,
      ),
      child: AnimatedSplashScreen(
        duration: 2,
        splash: 'assets/icons/gpa.png',
        nextScreen: const HomeView(),
        splashTransition: SplashTransition.values[4],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
