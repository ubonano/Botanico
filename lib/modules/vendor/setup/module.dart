import 'package:get/get.dart';

import '../../app/content/setup/interfaces/i_module_structure.dart';
import '../ui/ui.dart';
import '../vendor_business_logic.dart';
import '../vendor_repository.dart';
import '../vendor_service.dart';
import 'interfaces/i_vendor_business_logic.dart';
import 'interfaces/i_vendor_repository.dart';
import 'interfaces/i_vendor_service.dart';
export '../../app/content/setup/interfaces/i_module_structure.dart';

class VendorModule implements IModuleStructure {
  @override
  String get id => moduleId;
  static const String moduleId = 'vendor';

  @override
  String get label => moduleLabel;
  static const String moduleLabel = 'Proveedores';

  @override
  List<KeyModel> get keys => VendorKeys.values.map((key) => KeyModel(id: key.id, label: key.label)).toList();

  static void dependencies() {
    Get.lazyPut<VendorModule>(() => VendorModule(), fenix: true);

    Get.lazyPut<IVendorBusinessLogic>(() => VendorBusinessLogic(), fenix: true);
    Get.lazyPut<IVendorRepository>(() => VendorRepository(), fenix: true);
    Get.lazyPut<IVendorService>(() => VendorService(), fenix: true);

    Get.lazyPut<VendorFormController>(() => VendorFormController(), fenix: true);
    Get.lazyPut<VendorListController>(() => VendorListController(), fenix: true);
  }

  static final List<GetPage> pages = [
    VendorFormPage.page,
    VendorListPage.page,
  ];
}

enum VendorKeys {
  view('${VendorModule.moduleId}.view', 'Ver'),
  create('${VendorModule.moduleId}.create', 'Crear'),
  update('${VendorModule.moduleId}.update', 'Actualizar'),
  delete('${VendorModule.moduleId}.delete', 'Eliminar');

  final String id;
  final String label;

  const VendorKeys(this.id, this.label);
}
