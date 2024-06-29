import 'package:flutter/material.dart';

import '../../../../../app/ui/navigation.dart';
import '../../../../../app/ui/ui.dart';

class CompanyCreateNavigateButton extends StatelessWidget with AppNavigationInstance {
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
