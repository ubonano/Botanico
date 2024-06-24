import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding,
        ),
        child: Text(text),
      ),
    );
  }
}
