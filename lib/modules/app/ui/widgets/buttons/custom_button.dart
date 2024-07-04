import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const CustomButton({
    Key? key,
    required this.text,
    this.enabled = true,
    this.isLoading = false,
    required this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    this.margin = const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: (enabled && !isLoading) ? onPressed : null,
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(color: textColor, strokeWidth: 2.0),
                  )
                : Text(text, style: TextStyle(color: textColor)),
          ),
        ),
      ),
    );
  }
}
