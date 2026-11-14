import 'package:flutter/material.dart';

/// Red elevated button: text on the left, arrow on the right.
/// Background Red, Padding 16, Elevation 0, Border Radius Circular,
/// Text Style 20 bold.
class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_forward, size: 22),
          ],
        ),
      ),
    );
  }
}
