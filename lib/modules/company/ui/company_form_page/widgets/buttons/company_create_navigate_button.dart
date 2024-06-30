import 'package:flutter/material.dart';

import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class CompanyCreateNavigateButton extends StatelessWidget {
  const CompanyCreateNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('CompanyCreateNavigateButton'),
      text: '¿Necesitas registrar una empresa?',
      onPressed: CompanyFormPage.navigate,
    );
  }
}
