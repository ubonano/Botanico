import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

class CompanyCreateNavigateButton extends StatelessWidget with NavigationHelperInstance {
  CompanyCreateNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('CompanyCreateNavigateButton'),
      text: '¿Necesitas registrar una empresa?',
      onPressed: navigate.toCompanyForm,
    );
  }
}
