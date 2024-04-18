import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToCreateCompanyButton extends StatelessWidget {
  const ToCreateCompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigate = Get.find();

    return CustomButton(
      key: key ?? const Key('ToCreateCompany'),
      text: '¿Necesitas registrar una empresa?',
      onPressed: navigate.toCompany,
    );
  }
}
