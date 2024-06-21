import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../../../module.dart';

class CompanyFormPageTileButton extends StatelessWidget with NavigationHelperInstance {
  CompanyFormPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedCompany = Get.find<ICompanyService>().loggedCompany$;

    return ProtectedWidget(
      key: key ?? const Key('CompanyFormPageTileButton'),
      module: CompanyModulePermissions().toModel(),
      permission: CompanyModulePermissions.updateKey,
      child: ListTile(
        leading: const Icon(Icons.business),
        title: Text(loggedCompany?.name ?? ''),
        onTap: () => navigate.toCompanyForm(id: loggedCompany?.uid ?? '', canPop: true),
      ),
    );
  }
}
