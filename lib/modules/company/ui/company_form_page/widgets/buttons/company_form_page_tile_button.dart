import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../module.dart';

class CompanyFormPageTileButton extends StatelessWidget with NavigationHelperInstance {
  CompanyFormPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedCompany = Get.find<ICompanyService>().loggedCompany$;

    return ProtectedWidget(
      key: key ?? const Key('CompanyFormPageTileButton'),
      module: CompanyModule(),
      permission: CompanyModule.updateKey,
      child: ListTile(
        leading: const Icon(Icons.business),
        title: Text(loggedCompany?.name ?? ''),
        onTap: () => navigate.toCompanyForm(id: loggedCompany?.uid ?? '', canPop: true),
      ),
    );
  }
}
