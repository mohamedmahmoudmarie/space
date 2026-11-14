import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Circular red elevated button with a white icon (size 22).
class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.red.withValues(alpha: 0.35),
        disabledForegroundColor: AppColors.white.withValues(alpha: 0.6),
        elevation: 0,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Icon(icon, size: 22),
    );
  }
}
