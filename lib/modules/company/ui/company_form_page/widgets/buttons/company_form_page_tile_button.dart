import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/navigation.dart';
import '../../../../../app/ui/ui.dart';
import '../../../../content/setup/interfaces/i_company_service.dart';
import '../../../../content/setup/permissions.dart';

class CompanyFormPageTileButton extends StatelessWidget with AppNavigationInstance {
  CompanyFormPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedCompany = Get.find<ICompanyService>().loggedCompany$;

    late final CompanyPermissions module = Get.find();

    return ProtectedWidget(
      key: key ?? const Key('CompanyFormPageTileButton'),
      module: module,
      permission: module.updateKey,
      child: ListTile(
        leading: const Icon(Icons.business),
        title: Text(loggedCompany?.name ?? ''),
        onTap: () => navigate.toCompanyForm(id: loggedCompany?.uid ?? '', canPop: true),
      ),
    );
  }
}
