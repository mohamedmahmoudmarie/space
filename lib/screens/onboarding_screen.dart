import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

/// Screen Zero : 3 layers stacked together
/// 1. Image that fits the screen width and height
/// 2. Title "Explore The Universe" (48, bold, white)
/// 3. "Explore" button at the bottom -> navigates to Home
class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Layer One
          Image.asset(
            'assets/images/onboarding_bg.png',
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),
          // Layer Two
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore\nThe\nUniverse',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  height: 1.15,
                ),
              ),
            ),
          ),
          // Layer Three
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: PrimaryButton(
                title: 'Explore',
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
