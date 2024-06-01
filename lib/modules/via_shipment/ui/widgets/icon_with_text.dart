import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? boldText;
  final Color? iconColor;

  const IconWithText({
    required this.icon,
    required this.text,
    this.boldText,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 4),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: text.replaceAll(boldText ?? '', ''),
                children: boldText != null
                    ? [
                        TextSpan(
                          text: boldText,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.2),
                        ),
                      ]
                    : [],
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
