import 'package:flutter/material.dart';

import '../content/setup/navigation.dart';

class ConfirmationDialog extends StatelessWidget with NavigationHelperInstance {
  final String title;
  final String content;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onConfirm;

  ConfirmationDialog({
    Key? key,
    required this.title,
    required this.content,
    this.cancelButtonText = 'Cancelar',
    this.confirmButtonText = 'Confirmar',
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => navigate.back(),
          child: Text(cancelButtonText),
        ),
        TextButton(
          onPressed: () {
            navigate.back();
            onConfirm();
          },
          child: Text(confirmButtonText),
        ),
      ],
    );
  }

  static void show(
    BuildContext context, {
    String title = 'Confirmación',
    required String content,
    String cancelButtonText = 'Cancelar',
    String confirmButtonText = 'Confirmar',
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmationDialog(
        title: title,
        content: content,
        cancelButtonText: cancelButtonText,
        confirmButtonText: confirmButtonText,
        onConfirm: onConfirm,
      ),
    );
  }
}
