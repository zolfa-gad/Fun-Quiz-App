import 'package:flutter/material.dart';

class IconButtonCall extends StatelessWidget {
  const IconButtonCall({
    super.key,
    required this.icon,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    this.iconColor = Colors.black,
  });

  final IconData icon;
  final EdgeInsets padding;
  final VoidCallback? onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
      ),
    );
  }
}
