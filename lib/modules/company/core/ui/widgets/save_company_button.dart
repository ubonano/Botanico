import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveCompanyButton extends StatelessWidget {
  const SaveCompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyCreateController controller = Get.find();

    return CustomButton(
      key: key ?? const Key('saveCompanyButton'),
      text: 'Guardar empresa',
      onPressed: controller.secureSubmit,
    );
  }
}
