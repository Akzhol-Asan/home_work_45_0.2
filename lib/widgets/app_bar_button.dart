import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final String buttonText;
  final Color? color;
  final Function() onTap;
  final TextStyle? style;

  const AppBarButton({
    super.key,
    required this.buttonText,
    this.color,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(buttonText, style: style));
  }
}
