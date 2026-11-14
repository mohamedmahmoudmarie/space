import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'action_button.dart';

/// Stacked app bar used in Home and Details:
/// image background + gradient on top + top-centered title
/// + bottom-left title (+ optional back button).
class HeaderBanner extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final bool showBack;

  /// Where the bottom title sits: bottom-left on Home, center-left on Details.
  final bool bottomTitleCentered;

  const HeaderBanner({
    super.key,
    required this.topTitle,
    required this.bottomTitle,
    this.showBack = false,
    this.bottomTitleCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final topPadding = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: 230 + topPadding,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Layer 1 : image
          Image.asset(
            'assets/images/explore_header.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          // Layer 2 : gradient
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000),
                  Color(0x660E0E0E),
                  AppColors.black,
                ],
                stops: [0.0, 0.55, 1.0],
              ),
            ),
          ),
          // Layer 3 : texts + back button
          Padding(
            padding: EdgeInsets.fromLTRB(16, topPadding + 16, 16, 16),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(topTitle, style: textTheme.titleLarge),
                  ),
                ),
                if (showBack)
                  Align(
                    alignment: Alignment.topLeft,
                    child: ActionButton(
                      icon: Icons.arrow_back,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                Align(
                  alignment: bottomTitleCentered
                      ? Alignment.centerLeft
                      : Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: bottomTitleCentered ? 40 : 0),
                    child: Text(bottomTitle, style: textTheme.titleLarge),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
