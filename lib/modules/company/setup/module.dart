import 'package:get/get.dart';

import 'interfaces/i_company_business_logic.dart';
import 'interfaces/i_company_repository.dart';
import 'interfaces/i_company_service.dart';
import '../company_business_logic.dart';
import '../company_repository.dart';
import '../company_service.dart';
import '../ui/ui.dart';
export '../../app/content/setup/interfaces/i_module_structure.dart';

class CompanyModule implements IModuleStructure {
  @override
  String get id => moduleId;
  static const String moduleId = 'company';

  @override
  String get label => moduleLabel;
  static const String moduleLabel = 'Empresa';

  @override
  List<KeyModel> get keys => CompanyKeys.values.map((key) => KeyModel(id: key.id, label: key.label)).toList();

  static void dependencies() {
    Get.put<CompanyModule>(CompanyModule(), permanent: true);

    Get.put<ICompanyBusinessLogic>(CompanyBusinessLogic(), permanent: true);
    Get.put<ICompanyRepository>(CompanyRepository(), permanent: true);
    Get.put<ICompanyService>(CompanyService(), permanent: true);

    Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
  }

  static final List<GetPage> pages = [
    CompanyFormPage.page,
  ];
}

enum CompanyKeys {
  update('${CompanyModule.moduleId}.update', 'Actualizar');

  final String id;
  final String label;

  const CompanyKeys(this.id, this.label);
}
